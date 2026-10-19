import org.hl7.fhir.convertors.factory.VersionConvertorFactory_40_50;
import org.hl7.fhir.r5.context.IWorkerContext;
import org.hl7.fhir.r5.liquid.LiquidEngine;
import org.hl7.fhir.r5.model.Base;
import org.hl7.fhir.r5.model.Resource;

import java.io.FileInputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Renders the FHIR Liquid narrative templates in input/liquid against the IG's own
 * resources, using the IG Publisher's LiquidEngine, and fails if any of them throws.
 *
 * Why this exists: a broken narrative template does NOT fail the build and emits no QA
 * message. The IG Publisher catches the exception and silently replaces the whole
 * narrative with one line -- "Exception generating Narrative: ..." -- on the rendered
 * page. Both CapabilityStatement pages shipped that way from 54b11fa9b (2026-01-04)
 * until 2026-10-16, because two FHIRPath expressions had a stray closing parenthesis.
 * Only an expression on a code path that is actually reached fails, so parsing the
 * template is not enough; it has to be rendered against real resources.
 *
 * Run it from check_liquid.sh, which takes about five seconds, rather than finding out
 * twelve minutes into a build.
 *
 * Usage: LiquidRenderCheck <liquid-dir> <resource.json> [<resource.json> ...]
 *        LiquidRenderCheck --render <template.liquid> <resource.json>
 * Exit:  0 all rendered, 1 at least one failed, 2 bad invocation.
 *
 * --render is the iterate-on-a-template mode: it prints the narrative the publisher
 * would put on the page to stdout, and the XHTML-parse and unrendered-markdown
 * findings to stderr, so the narrative can be redirected or diffed on its own. The
 * template may live anywhere, so a candidate can be tried without touching
 * input/liquid; its includes resolve against its own directory.
 */
public class LiquidRenderCheck {

  /**
   * The real R5 structure definitions, loaded from the package cache. A stub context
   * is not good enough: without model information FHIRPath silently resolves many
   * paths to empty, so statements never reach the filter that would have failed and
   * the check passes while the build does not. Measured on 2026-10-16 -- a stub
   * context rendered CapabilityStatement.liquid clean while the publisher died with
   * an NPE in the same template.
   *
   * No terminology server and no IG packages: this only has to resolve element paths.
   */
  static IWorkerContext realContext() throws Exception {
    org.hl7.fhir.utilities.npm.FilesystemPackageCacheManager pcm =
        new org.hl7.fhir.utilities.npm.FilesystemPackageCacheManager.Builder().build();
    org.hl7.fhir.utilities.npm.NpmPackage npm = pcm.loadPackage("hl7.fhir.r5.core", "5.0.0");
    return new org.hl7.fhir.r5.context.SimpleWorkerContext.SimpleWorkerContextBuilder()
        .withAllowLoadingDuplicates(true)
        .fromPackage(npm);
  }

  /** Fallback when the R5 core package is not in the cache. */
  static IWorkerContext stubContext() {
    return (IWorkerContext) Proxy.newProxyInstance(
        LiquidRenderCheck.class.getClassLoader(),
        new Class<?>[] { IWorkerContext.class },
        new InvocationHandler() {
          public Object invoke(Object proxy, Method method, Object[] args) {
            // The engine builds its error text through formatMessage, so resolve it
            // properly; otherwise a failure reports only its position.
            if ("formatMessage".equals(method.getName()) && args != null && args.length > 0) {
              return message(String.valueOf(args[0]));
            }
            Class<?> r = method.getReturnType();
            if (r == boolean.class) return Boolean.FALSE;
            if (r == int.class) return 0;
            if (r == long.class) return 0L;
            if (r == double.class) return 0d;
            if (r == float.class) return 0f;
            if (r == char.class) return (char) 0;
            if (r == byte.class) return (byte) 0;
            if (r == short.class) return (short) 0;
            if (r == String.class) return "";
            if (r == List.class) return new ArrayList<>();
            if (r == Set.class) return new HashSet<>();
            if (r == Map.class) return new HashMap<>();
            return null;
          }
        });
  }

  /** Looks up an i18n key in the publisher's message bundle, falling back to the key. */
  static String message(String key) {
    try {
      return java.util.ResourceBundle.getBundle("Messages", java.util.Locale.ENGLISH).getString(key);
    } catch (Exception e) {
      return key;
    }
  }

  /**
   * Markdown markers that should never survive into a rendered narrative: bold
   * runs, inline code spans, and inline links. HTML comments are stripped first,
   * because Liquid renders inside them and the publisher then discards them. A hit means either the field was
   * emitted without "|| markdownify", or the source markdown is malformed so the
   * processor left it alone -- "** SHOULD**" does not bold, because the space
   * after the opening marker breaks the emphasis run. Returns a short excerpt
   * around the first hit, or null when the narrative looks clean.
   */
  static String unrenderedMarkdown(String narrative) {
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(
        "\\*\\*[^*\\n]{1,80}\\*\\*|`[^`\\n]{1,80}`|\\[[^\\]\\n]{1,80}\\]\\([^)\\n]{1,120}\\)");
    // Liquid runs inside HTML comments -- it is text-level templating and knows
    // nothing about <!-- -->. So a commented-out block still renders into the
    // narrative, and the publisher's XHTML parse then drops it. Scanning it would
    // report dead code: strip comments before looking for markdown markers.
    java.util.regex.Matcher m = p.matcher(narrative.replaceAll("(?s)<!--.*?-->", ""));
    if (!m.find()) return null;
    int from = Math.max(0, m.start() - 60);
    int to = Math.min(narrative.length(), m.end() + 60);
    return "..." + narrative.substring(from, to).replaceAll("\\s+", " ") + "...";
  }

  /** Reads a resource as R4 and converts to R5, falling back to reading it as R5.
   *  An R4 IG can still carry preadopted R5 resources -- US Core ships the
   *  Requirements resources that way. Returns null when it is neither. */
  static Resource load(String file) {
    try {
      org.hl7.fhir.r4.model.Resource r4 = (org.hl7.fhir.r4.model.Resource)
          new org.hl7.fhir.r4.formats.JsonParser().parse(new FileInputStream(file));
      return VersionConvertorFactory_40_50.convertResource(r4);
    } catch (Exception e4) {
      try {
        return (Resource) new org.hl7.fhir.r5.formats.JsonParser().parse(new FileInputStream(file));
      } catch (Exception e5) {
        return null;
      }
    }
  }

  /** The engine the publisher uses, with includes resolved against one directory. */
  static LiquidEngine engineFor(final Path includeDir) throws Exception {
    IWorkerContext ctx;
    try {
      ctx = realContext();
    } catch (Throwable t) {
      System.err.println("   (!) could not load hl7.fhir.r5.core#5.0.0 from the package cache: "
          + t.getMessage());
      System.err.println("   (!) falling back to a stub context -- expressions will under-resolve"
          + " and a real failure can be missed");
      ctx = stubContext();
    }
    LiquidEngine engine = new LiquidEngine(ctx, null);
    engine.setIncludeResolver(new LiquidEngine.ILiquidEngineIncludeResolver() {
      public String fetchInclude(LiquidEngine eng, String name) {
        try {
          return new String(Files.readAllBytes(includeDir.resolve(name)), StandardCharsets.UTF_8);
        } catch (Exception e) {
          throw new RuntimeException("liquid include not found: " + name);
        }
      }
    });
    return engine;
  }

  /** --render: print one template rendered against one resource. */
  static int render(String templateArg, String resourceArg) throws Exception {
    Path tpl = Paths.get(templateArg);
    if (!Files.exists(tpl)) {
      System.err.println("no such template: " + tpl);
      return 2;
    }
    Resource r5 = load(resourceArg);
    if (r5 == null) {
      System.err.println("not a parseable R4 or R5 resource: " + resourceArg);
      return 2;
    }
    Path dir = tpl.toAbsolutePath().getParent();
    LiquidEngine engine = engineFor(dir);
    String narrative;
    try {
      LiquidEngine.LiquidDocument doc = engine.parse(
          new String(Files.readAllBytes(tpl), StandardCharsets.UTF_8), tpl.getFileName().toString());
      narrative = engine.evaluate(doc, (Base) r5, null);
    } catch (Throwable t) {
      String msg = t.getMessage();
      System.err.println("FAIL render: " + (msg == null || msg.isEmpty()
          ? t.getClass().getSimpleName() : msg));
      System.err.println("     the publisher would replace the whole narrative with"
          + " \"Exception generating Narrative\" and emit no QA message");
      return 1;
    }
    System.out.print(narrative);          // stdout: the narrative only, so it can be piped
    System.err.println("---- " + tpl.getFileName() + " on " + r5.fhirType()
        + "/" + (r5.getId() == null ? "(no id)" : r5.getId()) + " ----");
    try {
      new org.hl7.fhir.utilities.xhtml.XhtmlParser().parseFragment(narrative);
      System.err.println("  xhtml parse: OK");
    } catch (Throwable t) {
      System.err.println("  xhtml parse: FAIL -- " + t.getMessage());
      System.err.println("  the publisher would show \"Exception parsing generated"
          + " Narrative\" instead of the content");
      return 1;
    }
    String leftover = unrenderedMarkdown(narrative);
    System.err.println("  unrendered markdown: " + (leftover == null ? "none" : leftover));
    System.err.println("  " + narrative.length() + " chars");
    return 0;
  }

  public static void main(String[] args) throws Exception {
    if (args.length > 0 && "--render".equals(args[0])) {
      if (args.length != 3) {
        System.err.println("usage: LiquidRenderCheck --render <template.liquid> <resource.json>");
        System.exit(2);
      }
      System.exit(render(args[1], args[2]));
    }
    if (args.length < 2) {
      System.err.println("usage: LiquidRenderCheck <liquid-dir> <resource.json> ...");
      System.exit(2);
    }
    Path liquidDir = Paths.get(args[0]);

    IWorkerContext ctx;
    try {
      ctx = realContext();
    } catch (Throwable t) {
      System.out.println("   (!) could not load hl7.fhir.r5.core#5.0.0 from the package cache: "
          + t.getMessage());
      System.out.println("   (!) falling back to a stub context -- expressions will under-resolve"
          + " and a real failure can be missed");
      ctx = stubContext();
    }
    LiquidEngine engine = new LiquidEngine(ctx, null);
    engine.setIncludeResolver(new LiquidEngine.ILiquidEngineIncludeResolver() {
      public String fetchInclude(LiquidEngine eng, String name) {
        try {
          return new String(Files.readAllBytes(liquidDir.resolve(name)), StandardCharsets.UTF_8);
        } catch (Exception e) {
          throw new RuntimeException("liquid include not found: " + name);
        }
      }
    });

    // template source per resource type; only types with a template are checked
    Map<String, String> templates = new LinkedHashMap<>();
    Map<String, Integer> rendered = new LinkedHashMap<>();
    Map<String, String> failures = new LinkedHashMap<>();
    Map<String, Integer> failed = new LinkedHashMap<>();
    Map<String, String> warnings = new LinkedHashMap<>();
    int skipped = 0;

    for (int i = 1; i < args.length; i++) {
      String file = args[i];
      Resource r5;
      try {
        org.hl7.fhir.r4.model.Resource r4 = (org.hl7.fhir.r4.model.Resource)
            new org.hl7.fhir.r4.formats.JsonParser().parse(new FileInputStream(file));
        r5 = VersionConvertorFactory_40_50.convertResource(r4);
      } catch (Exception e4) {
        // An R4 IG can still carry preadopted R5 resources -- US Core ships the
        // Requirements resources that way -- so fall back to reading as R5.
        try {
          r5 = (Resource) new org.hl7.fhir.r5.formats.JsonParser().parse(new FileInputStream(file));
        } catch (Exception e5) {
          skipped++;
          continue; // neither R4 nor R5; nothing to render
        }
      }
      String type = r5.fhirType();
      Path tpl = liquidDir.resolve(type + ".liquid");
      if (!Files.exists(tpl)) continue;

      try {
        if (!templates.containsKey(type)) {
          templates.put(type, new String(Files.readAllBytes(tpl), StandardCharsets.UTF_8));
        }
        // re-parse per resource: a LiquidStatement caches its compiled FHIRPath on
        // the node, so a document reused after a failure can report the next
        // resource as OK on a half-compiled statement
        LiquidEngine.LiquidDocument doc = engine.parse(templates.get(type), type + ".liquid");
        String narrative = engine.evaluate(doc, (Base) r5, null);
        // The publisher parses the rendered narrative as an XHTML fragment and
        // discards it if that fails, with a second silent message on the page:
        // "Exception parsing generated Narrative ... Unable to read attribute on
        // <x>". That happens when markdown reaches the page unrendered -- a filter
        // written with a single "|" is a FHIRPath union and is silently ignored,
        // so text like <patient|user|system> arrives as a bogus tag.
        new org.hl7.fhir.utilities.xhtml.XhtmlParser().parseFragment(narrative);
        rendered.merge(type, 1, Integer::sum);
        // Valid XHTML is not the same as rendered markdown. A markdown-valued
        // element emitted without "|| markdownify" lands on the page as source
        // text, which is legal XHTML and so passes the parse above. Flag the
        // markers that survive, so the next field nobody filtered is visible.
        String leftover = unrenderedMarkdown(narrative);
        if (leftover != null) {
          warnings.putIfAbsent(type + ".liquid", leftover);
        }
      } catch (Throwable t) {
        String msg = t.getMessage();
        if (msg == null || msg.isEmpty()) msg = t.getClass().getSimpleName();
        failed.merge(type, 1, Integer::sum);
        failures.putIfAbsent(type + ".liquid", msg + "\n      first seen rendering " + file);
      }
    }

    for (Map.Entry<String, Integer> e : rendered.entrySet()) {
      System.out.println("   OK   " + e.getKey() + ".liquid rendered " + e.getValue() + " resource(s)");
    }
    for (Map.Entry<String, String> e : warnings.entrySet()) {
      System.out.println("   WARN " + e.getKey()
          + " left markdown source in the narrative. Either a markdown-valued field"
          + " is missing \"|| markdownify\", or the source markdown is malformed and"
          + " cannot render: " + e.getValue());
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
