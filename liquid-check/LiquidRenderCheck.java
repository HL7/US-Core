import org.hl7.fhir.convertors.factory.VersionConvertorFactory_40_50;
import org.hl7.fhir.igtools.publisher.IGPublisherLiquidTemplateServices;
import org.hl7.fhir.model.IModelContext;
import org.hl7.fhir.model.ModelContext;
import org.hl7.fhir.model.core.Resource;
import org.hl7.fhir.services.context.IWorkerContext;
import org.hl7.fhir.services.renderers.LiquidRenderer;
import org.hl7.fhir.services.renderers.Renderer;
import org.hl7.fhir.services.renderers.RendererFactory;
import org.hl7.fhir.services.renderers.utils.RenderingContext;
import org.hl7.fhir.services.renderers.utils.ResourceWrapper;
import org.hl7.fhir.standalone.context.SimpleWorkerContext;
import org.hl7.fhir.utilities.MarkDownProcessor;
import org.hl7.fhir.utilities.FhirPublication;
import org.hl7.fhir.utilities.validation.ValidationOptions;
import org.hl7.fhir.utilities.xhtml.NodeType;
import org.hl7.fhir.utilities.xhtml.XhtmlComposer;
import org.hl7.fhir.utilities.xhtml.XhtmlNode;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Renders the FHIR Liquid narrative templates in input/liquid against the IG's own
 * resources, through the IG Publisher's own renderer, and fails if any of them does
 * not survive.
 *
 * Why this exists: a broken narrative template does NOT fail the build and emits no QA
 * message. LiquidRenderer.buildNarrative catches the exception and silently replaces the
 * whole narrative with one line on the rendered page -- either
 *
 *   "Exception generating Narrative: ..."        (the template threw while rendering)
 *   "Exception parsing generated Narrative: ..." (it rendered invalid XHTML)
 *
 * -- and the build goes on reporting success. Both CapabilityStatement pages shipped the
 * first way from 54b11fa9b (2026-01-04) until 2026-10-16, because two FHIRPath
 * expressions had a stray closing parenthesis, and both shipped the second way on
 * publisher 3.0.1 until 2026-10-26, because {{r.type}} started rendering as a hyperlink
 * and landed an <a> element inside an href attribute.
 *
 * It has to go through the publisher's renderer, not just a LiquidEngine, because what a
 * "{{ expr }}" emits depends on the renderer attached to the engine. Up to publisher
 * 2.3.4 the engine emitted the raw primitive value. From 3.0.1 the engine is
 * org.hl7.fhir.services.liquid.LiquidEngine and its rendering support is
 * LiquidRenderer.renderForLiquid, which pipes every DataType result through
 * renderDataType and returns rendered HTML -- so a code can arrive as a link, and only a
 * non-DataType result falls through to toString(). An engine built without
 * setRenderingSupport renders everything plain, passes, and tells you nothing: this
 * check did exactly that and reported OK on the 3.0.1 failure.
 *
 * So the chain below is the publisher's: a real worker context, a RenderingContext whose
 * template provider is the publisher's own IGPublisherLiquidTemplateServices, and
 * LiquidRenderer.buildNarrative. buildNarrative swallows its own failure, so the check is
 * to look for the error paragraph it leaves behind.
 *
 * Rendering is not enough on its own either: an expression is compiled when its code path
 * is first reached, so a bad expression inside an {% if %} branch parses clean and fails
 * at render; and a template can render and parse yet still be wrong -- a filter written
 * with a single "|" is a FHIRPath union, silently ignored, so markdown reaches the page
 * unrendered.
 *
 * Takes a few seconds. Run it before a build, or let publish.sh -i run it.
 *
 * Requires java 17+ (single-file source mode) and the IG Publisher jar, which is already
 * a build prerequisite. Override the jar location with IG_PUBLISHER_JAR.
 *
 * Usage: LiquidRenderCheck <liquid-dir> <resource.json> [<resource.json> ...]
 *        LiquidRenderCheck --render <liquid-dir> <template.liquid> <resource.json>
 * Exit:  0 all rendered, 1 at least one failed or the renderer could not be built,
 *        2 bad invocation.
 *
 * --render is the iterate-on-a-template mode: it prints the narrative the publisher would
 * put on the page to stdout, and the findings to stderr, so the narrative can be
 * redirected or diffed on its own. The liquid-dir is still given, because that is where
 * {% include %} resolves from; the template itself may live anywhere, so a candidate can
 * be tried without touching input/liquid.
 */
public class LiquidRenderCheck {

  /** The marker LiquidRenderer leaves on the page when it has given up on a narrative. */
  static final String[] FAILURE_MARKERS = {
    "Exception generating Narrative",
    "Exception parsing generated Narrative"
  };

  /**
   * The real R5 structure definitions, loaded from the package cache. Model information
   * is not optional: without it FHIRPath silently resolves many paths to empty, so
   * statements never reach the expression that would have failed. Measured on 2026-10-16
   * -- a stub context rendered CapabilityStatement.liquid clean while the publisher died
   * with an NPE in the same template.
   *
   * No terminology server and no IG packages: this only has to resolve element paths and
   * render data types.
   */
  static IWorkerContext realContext(IModelContext model) throws Exception {
    org.hl7.fhir.utilities.npm.FilesystemPackageCacheManager pcm =
        new org.hl7.fhir.utilities.npm.FilesystemPackageCacheManager.Builder().build();
    org.hl7.fhir.utilities.npm.NpmPackage npm = pcm.loadPackage("hl7.fhir.r5.core", "5.0.0");
    return new SimpleWorkerContext.SimpleWorkerContextBuilder(model)
        .withAllowLoadingDuplicates(true)
        .fromPackage(npm);
  }

  /**
   * The publisher's rendering chain, with {% include %} resolved the way the publisher
   * resolves it -- through IGPublisherLiquidTemplateServices, which loads every .liquid
   * and .html file in the directory, so an include lands on the same file the build
   * would use.
   */
  static RenderingContext renderingContext(IWorkerContext ctx, Path liquidDir) throws Exception {
    RenderingContext rc = new RenderingContext(
        ctx,
        new RendererFactory(),
        new MarkDownProcessor(MarkDownProcessor.Dialect.COMMON_MARK),
        new ValidationOptions(FhirPublication.R4),
        "http://hl7.org/fhir/R4",     // specPath: where core resource links point
        "",                           // prefix
        Locale.US,
        RenderingContext.ResourceRendererMode.END_USER,
        RenderingContext.GenerationRules.IG_PUBLISHER);
    IGPublisherLiquidTemplateServices templates = new IGPublisherLiquidTemplateServices();
    templates.load(liquidDir.toString());
    rc.setTemplateProvider(templates);
    return rc;
  }

  /**
   * Markdown markers that should never survive into a rendered narrative: bold runs,
   * inline code spans, and inline links. HTML comments are stripped first, because Liquid
   * renders inside them and the publisher then discards them. A hit means either the
   * field was emitted without "|| markdownify", or the source markdown is malformed so
   * the processor left it alone -- "** SHOULD**" does not bold, because the space after
   * the opening marker breaks the emphasis run. Returns a short excerpt around the first
   * hit, or null when the narrative looks clean.
   */
  static String unrenderedMarkdown(String narrative) {
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(
        "\\*\\*[^*\\n]{1,80}\\*\\*|`[^`\\n]{1,80}`|\\[[^\\]\\n]{1,80}\\]\\([^)\\n]{1,120}\\)");
    // Liquid runs inside HTML comments -- it is text-level templating and knows nothing
    // about <!-- -->. So a commented-out block still renders into the narrative, and the
    // publisher's XHTML parse then drops it. Scanning it would report dead code: strip
    // comments before looking for markdown markers.
    java.util.regex.Matcher m = p.matcher(narrative.replaceAll("(?s)<!--.*?-->", ""));
    if (!m.find()) return null;
    int from = Math.max(0, m.start() - 60);
    int to = Math.min(narrative.length(), m.end() + 60);
    return "..." + narrative.substring(from, to).replaceAll("\\s+", " ") + "...";
  }

  /**
   * Reads a resource into the publisher's current model. There is no R4 reader for
   * org.hl7.fhir.model.core and VersionConvertorFactory_40_50 still targets the retired
   * org.hl7.fhir.r5.model, so the bridge is R4 -> r5.model -> JSON -> model.core. An R4
   * IG can also carry preadopted R5 resources -- US Core ships the Requirements resources
   * that way -- so fall back to reading the file as R5 before giving up. Returns null when
   * it is neither.
   */
  static Resource load(IModelContext model, String file) {
    org.hl7.fhir.r5.model.Resource r5;
    try {
      org.hl7.fhir.r4.model.Resource r4 = (org.hl7.fhir.r4.model.Resource)
          new org.hl7.fhir.r4.formats.JsonParser().parse(new FileInputStream(file));
      r5 = VersionConvertorFactory_40_50.convertResource(r4);
    } catch (Exception e4) {
      try {
        r5 = (org.hl7.fhir.r5.model.Resource)
            new org.hl7.fhir.r5.formats.JsonParser().parse(new FileInputStream(file));
      } catch (Exception e5) {
        return null;
      }
    }
    try {
      ByteArrayOutputStream bs = new ByteArrayOutputStream();
      new org.hl7.fhir.r5.formats.JsonParser().compose(bs, r5);
      return new org.hl7.fhir.model.core.formats.JsonParser(model)
          .parse(new ByteArrayInputStream(bs.toByteArray()));
    } catch (Exception e) {
      return null;
    }
  }

  /** What one template did to one resource. */
  record Outcome(String narrative, String failure) {
    boolean ok() { return failure == null; }
  }

  /**
   * The publisher's narrative generation, verbatim: LiquidRenderer.buildNarrative builds
   * its own LiquidEngine from the RenderingContext, attaches renderForLiquid as the
   * rendering support, evaluates the template and parses the result as an XHTML fragment.
   * It catches everything, so a failure shows up as the error paragraph it writes in
   * place of the content rather than as a thrown exception -- which is the whole reason a
   * broken template does not fail the build.
   */
  static Outcome renderOne(RenderingContext rc, String template, Resource resource) {
    try {
      ResourceWrapper rw = ResourceWrapper.forResource(rc, resource);
      XhtmlNode x = new XhtmlNode(NodeType.Element, "div");
      new LiquidRenderer(rc, template).buildNarrative(new Renderer.RenderingStatus(), x, rw);
      String narrative = new XhtmlComposer(true).compose(x);
      for (String marker : FAILURE_MARKERS) {
        int at = narrative.indexOf(marker);
        if (at >= 0) {
          int to = Math.min(narrative.length(), at + 400);
          return new Outcome(narrative, narrative.substring(at, to)
              .replaceAll("<[^>]*>", "").replaceAll("\\s+", " ").trim());
        }
      }
      return new Outcome(narrative, null);
    } catch (Throwable t) {
      String msg = t.getMessage();
      return new Outcome(null, (msg == null || msg.isEmpty())
          ? t.getClass().getSimpleName() : msg);
    }
  }

  /** --render: print one template rendered against one resource. */
  static int render(String liquidDirArg, String templateArg, String resourceArg) {
    Path tpl = Paths.get(templateArg);
    Path liquidDir = Paths.get(liquidDirArg);
    if (!Files.exists(tpl)) {
      System.err.println("no such template: " + tpl);
      return 2;
    }
    IModelContext model = ModelContext.fullCoreContext();
    Resource resource = load(model, resourceArg);
    if (resource == null) {
      System.err.println("not a parseable R4 or R5 resource: " + resourceArg);
      return 2;
    }
    RenderingContext rc;
    String template;
    try {
      rc = renderingContext(realContext(model), liquidDir);
      template = new String(Files.readAllBytes(tpl), StandardCharsets.UTF_8);
    } catch (Throwable t) {
      System.err.println("could not build the publisher's renderer: " + t);
      return 1;
    }
    Outcome out = renderOne(rc, template, resource);
    if (out.narrative() != null) System.out.print(out.narrative());
    System.err.println("---- " + tpl.getFileName() + " on " + resource.fhirType()
        + "/" + (resource.getId() == null ? "(no id)" : resource.getId()) + " ----");
    if (!out.ok()) {
      System.err.println("  FAIL -- " + out.failure());
      System.err.println("  the publisher would show this in place of the content,"
          + " and emit no QA message");
      return 1;
    }
    System.err.println("  rendered and parsed: OK");
    System.err.println("  unrendered markdown: "
        + (unrenderedMarkdown(out.narrative()) == null ? "none" : unrenderedMarkdown(out.narrative())));
    System.err.println("  " + out.narrative().length() + " chars");
    return 0;
  }

  public static void main(String[] args) {
    if (args.length > 0 && "--render".equals(args[0])) {
      if (args.length != 4) {
        System.err.println("usage: LiquidRenderCheck --render <liquid-dir> <template.liquid>"
            + " <resource.json>");
        System.exit(2);
      }
      System.exit(render(args[1], args[2], args[3]));
    }
    if (args.length < 2) {
      System.err.println("usage: LiquidRenderCheck <liquid-dir> <resource.json> ...");
      System.exit(2);
    }
    Path liquidDir = Paths.get(args[0]);
    IModelContext model = ModelContext.fullCoreContext();

    // A check that cannot check must not report OK. The old version fell back to a stub
    // context here and passed on templates the publisher could not render.
    RenderingContext rc;
    try {
      rc = renderingContext(realContext(model), liquidDir);
    } catch (Throwable t) {
      System.out.println("   FAIL could not build the publisher's renderer -- nothing was"
          + " checked: " + t);
      System.out.println("        hl7.fhir.r5.core#5.0.0 must be in the package cache;"
          + " run a build once to populate it");
      System.exit(1);
      return;
    }

    Map<String, String> templates = new LinkedHashMap<>();   // type -> template source
    Map<String, Integer> rendered = new LinkedHashMap<>();
    Map<String, String> failures = new LinkedHashMap<>();
    Map<String, Integer> failed = new LinkedHashMap<>();
    Map<String, String> warnings = new LinkedHashMap<>();
    int skipped = 0;

    for (int i = 1; i < args.length; i++) {
      String file = args[i];
      Resource resource = load(model, file);
      if (resource == null) {
        skipped++;
        continue;
      }
      String type = resource.fhirType();
      Path tpl = liquidDir.resolve(type + ".liquid");
      if (!Files.exists(tpl)) continue;

      try {
        if (!templates.containsKey(type)) {
          templates.put(type, new String(Files.readAllBytes(tpl), StandardCharsets.UTF_8));
        }
      } catch (Exception e) {
        failures.putIfAbsent(type + ".liquid", "could not read " + tpl + ": " + e.getMessage());
        failed.merge(type, 1, Integer::sum);
        continue;
      }

      // The template source is re-handed to a fresh LiquidRenderer per resource, because
      // a LiquidStatement caches its compiled FHIRPath on the node: a document reused
      // after a failure can report the next resource as OK on a half-compiled statement.
      Outcome out = renderOne(rc, templates.get(type), resource);
      if (!out.ok()) {
        failed.merge(type, 1, Integer::sum);
        failures.putIfAbsent(type + ".liquid",
            out.failure() + "\n      first seen rendering " + file);
        continue;
      }
      rendered.merge(type, 1, Integer::sum);
      // Valid XHTML is not the same as rendered markdown. A markdown-valued element
      // emitted without "|| markdownify" lands on the page as source text, which is legal
      // XHTML and so survives the parse. Flag the markers that got through, so the next
      // field nobody filtered is visible.
      String leftover = unrenderedMarkdown(out.narrative());
      if (leftover != null) warnings.putIfAbsent(type + ".liquid", leftover);
    }

    for (Map.Entry<String, Integer> e : rendered.entrySet()) {
      System.out.println("   OK   " + e.getKey() + ".liquid rendered " + e.getValue() + " resource(s)");
    }
    for (Map.Entry<String, String> e : warnings.entrySet()) {
      System.out.println("   WARN " + e.getKey()
          + " left markdown source in the narrative. Either a markdown-valued field is"
          + " missing \"|| markdownify\", or the source markdown is malformed and cannot"
          + " render: " + e.getValue());
    }
    for (Map.Entry<String, String> e : failures.entrySet()) {
      String type = e.getKey().substring(0, e.getKey().length() - ".liquid".length());
      System.out.println("   FAIL " + e.getKey() + " failed on " + failed.get(type)
          + " resource(s): " + e.getValue());
    }
    if (skipped > 0) {
      System.out.println("   (" + skipped + " file(s) skipped: not a parseable R4 resource)");
    }
    if (templates.isEmpty() && failures.isEmpty()) {
      System.out.println("   no resources matched a template in " + liquidDir);
    }
    System.exit(failures.isEmpty() ? 0 : 1);
  }
}
