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
 * Exit:  0 all rendered, 1 at least one failed, 2 bad invocation.
 */
public class LiquidRenderCheck {

  /**
   * Parsing and rendering a template needs no terminology or package context, so the
   * worker context is a no-op proxy returning empty values. That keeps the check to a
   * few seconds instead of loading the FHIR core packages.
   */
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

  public static void main(String[] args) throws Exception {
    if (args.length < 2) {
      System.err.println("usage: LiquidRenderCheck <liquid-dir> <resource.json> ...");
      System.exit(2);
    }
    Path liquidDir = Paths.get(args[0]);

    LiquidEngine engine = new LiquidEngine(stubContext(), null);
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
        engine.evaluate(doc, (Base) r5, null);
        rendered.merge(type, 1, Integer::sum);
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
