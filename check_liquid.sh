#!/bin/bash
# =============================================================================
# check_liquid.sh -- render the FHIR Liquid narrative templates and fail loudly
#
# A broken template in input/liquid does not fail the IG Publisher build and
# produces no QA message. The publisher catches the exception and replaces the
# resource's whole narrative with a single line on the rendered page:
#
#   Exception generating Narrative: Error @1, 109: Unexpected syntax parsing
#   liquid statement
#
# Both CapabilityStatement pages shipped that way from 54b11fa9b (2026-01-04)
# until 2026-10-16 because two FHIRPath expressions had a stray ")".
#
# This renders each input/liquid/<ResourceType>.liquid against every matching
# resource using the IG Publisher's own LiquidEngine, then parses the result as
# an XHTML fragment the way the publisher does. Parsing the template alone is not
# enough: an expression is compiled when its code path is first reached, so a
# bad expression inside an {% if %} branch parses clean and fails at render. And
# a template can render without erroring yet still produce a narrative the
# publisher throws away -- a filter written with a single "|" is a FHIRPath
# union, silently ignored, so markdown reaches the page unrendered and text like
# <patient|user|system> parses as a bogus tag.
#
# Takes a few seconds. Run it before a build, or let publish.sh -i run it.
#
# Requires java 11+ (single-file source mode) and the IG Publisher jar, which is
# already a build prerequisite. Override the jar location with IG_PUBLISHER_JAR.
# =============================================================================

jar="${IG_PUBLISHER_JAR:-$HOME/Downloads/org.hl7.fhir.igpublisher.jar}"
liquid_dir="input/liquid"
src="liquid-check/LiquidRenderCheck.java"

echo "====================================================================="
echo "Rendering the Liquid narrative templates in $liquid_dir ..."
echo "====================================================================="

if [ ! -d "$liquid_dir" ]; then
  echo "⚠️  no $liquid_dir directory - nothing to check"
  exit 0
fi
if [ ! -f "$src" ]; then
  echo "❌ $src is missing"
  exit 1
fi
if [ ! -f "$jar" ]; then
  echo "⚠️  IG Publisher jar not found at $jar"
  echo "   set IG_PUBLISHER_JAR to its location, or run ./publish.sh -p to download it"
  exit 0
fi
if ! command -v java > /dev/null; then
  echo "⚠️  java not found on PATH - skipping"
  exit 0
fi

# Resources the publisher renders narratives for. fsh-generated holds the
# ImplementationGuide, which no template matches, but include it so a future
# template for it is covered too.
resources=()
for dir in input/resources fsh-generated/resources; do
  [ -d "$dir" ] || continue
  for f in "$dir"/*.json; do
    [ -e "$f" ] && resources+=("$f")
  done
done

if [ ${#resources[@]} -eq 0 ]; then
  echo "⚠️  no resources found - run ./publish.sh -y first"
  exit 0
fi

java -classpath "$jar" "$src" "$liquid_dir" "${resources[@]}"
status=$?

echo "====================================================================="
if [ $status -eq 0 ]; then
  echo "✅ Every Liquid template rendered without erroring."
else
  echo "❌ A Liquid template failed. The build will NOT report this: the affected"
  echo "   pages will show \"Exception generating Narrative\" (the template errored)"
  echo "   or \"Exception parsing generated Narrative\" (it rendered invalid XHTML,"
  echo "   usually markdown that reached the page unrendered) in place of their"
  echo "   content, and QA will stay clean."
fi
echo "====================================================================="
exit $status
