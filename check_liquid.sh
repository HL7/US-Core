#!/bin/bash
# =============================================================================
# check_liquid.sh -- render the FHIR Liquid narrative templates and fail loudly
#
# A broken template in input/liquid does not fail the IG Publisher build and
# produces no QA message. LiquidRenderer.buildNarrative catches the exception and
# replaces the resource's whole narrative with a single line on the rendered page:
#
#   Exception generating Narrative: ...          the template threw while rendering
#   Exception parsing generated Narrative: ...   it rendered invalid XHTML
#
# Both CapabilityStatement pages shipped the first way from 54b11fa9b (2026-01-04)
# until 2026-10-16, because two FHIRPath expressions had a stray ")". Both shipped
# the second way on publisher 3.0.1 until 2026-10-26, because {{r.type}} started
# rendering as a hyperlink and put an <a> element inside an href attribute.
#
# This renders each input/liquid/<ResourceType>.liquid against every matching
# resource through the publisher's own LiquidRenderer, then reports the error
# paragraph if one was left behind.
#
# It has to go through LiquidRenderer, not just a LiquidEngine. What "{{ expr }}"
# emits depends on the rendering support attached to the engine: up to publisher
# 2.3.4 the engine emitted the raw primitive value, while from 3.0.1 it pipes
# every DataType through renderDataType and returns rendered HTML, so a code can
# arrive as a link. An engine built without setRenderingSupport renders
# everything plain and passes -- this check did that, and reported OK on the
# 3.0.1 failure above. It also tracks the publisher's model: 3.0.1 moved off
# org.hl7.fhir.r5.* onto org.hl7.fhir.services.* / org.hl7.fhir.model.core.*,
# and a check still driving the retired classes is not checking the build.
#
# Rendering is not enough on its own either. An expression is compiled when its
# code path is first reached, so a bad expression inside an {% if %} branch parses
# clean and fails at render; and a template can render and parse yet still be
# wrong -- a filter written with a single "|" is a FHIRPath union, silently
# ignored, so markdown reaches the page unrendered and is reported as a WARN.
#
# Takes a few seconds. Run it before a build, or let publish.sh -i run it.
#
# To iterate on one template, print the narrative the publisher would produce:
#
#   java -classpath "$IG_PUBLISHER_JAR" liquid-check/LiquidRenderCheck.java \
#        --render input/liquid <template.liquid> <resource.json>
#
# The liquid dir is given as well as the template, because that is where
# {% include %} resolves from; the template itself may live anywhere, so a
# candidate can be tried without touching input/liquid. The narrative goes to
# stdout and the findings to stderr, so it can be redirected or diffed on its own.
#
# Requires java 17+ (single-file source mode) and the IG Publisher jar, which is
# already a build prerequisite. Override the jar location with IG_PUBLISHER_JAR.
# The first run also needs hl7.fhir.r5.core#5.0.0 in the FHIR package cache; a
# build puts it there.
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
  echo "✅ Every Liquid template that could be checked rendered without erroring."
  echo "   Any UNCHECKED line above is a template this harness could not cover at"
  echo "   all -- not a pass. Only a build verifies those."
else
  echo "❌ A Liquid template failed, or the renderer could not be built so nothing"
  echo "   was checked. Either way the build will NOT report it: the affected pages"
  echo "   will show \"Exception generating Narrative\" (the template errored) or"
  echo "   \"Exception parsing generated Narrative\" (it rendered invalid XHTML) in"
  echo "   place of their content, and QA will stay clean."
fi
echo "====================================================================="
exit $status
