#!/bin/bash
# exit when any command fails
set -e
trap "echo '================================================================='; echo '=================== publish.sh DONE! ==================='; echo '================================================================='" EXIT
trap "echo '================================================================='; echo '=================== publish.sh ERROR! ==================='; echo '================================================================='" ERR

while getopts bcdefghijklmnopqrstuvwxyzCVRL option;
do
 case "${option}"
 in
 b) DEBUG_ON='-debug';;
 c) COPY_CSV=1;;
 d) IN_DOCS=1;;
 e) APP_VERSION=1;;
 f) TERMINOLOGY_TABLES=1;;
 g) GEN_OFF='-generation-off';;
 h) VAL_OFF='-validation-off';;
 i) IG_PUBLISH=1;;
 j) RAPIDO='-rapido';;
 k) NO_PROFILE=1;;
 l) PAGE_LINKS=1;;
 n) NO_META=1;;
 o) PUB=1;;
 p) UPDATE_PUB=1;;
 q) VIEW_QA=1;;
 r) CLEAR_JSON=1;;
 s) SUSHI=1;;
 t) NA='N/A';;
 v) VIEW_OUTPUT=1;;
 x) REM_HIGHLIGHT=1;;
 y) YAML_JSON=1;;
 z) DEL_TEMP=1;;
 C) DEL_CACHE=1;;
 V) VSACURI=1;;
 R) GEN_REQ=1;;
 L) CHECK_LIQUID=1;;

 esac

done

# ========= Globals  =================
[[ "$NA" != "N/A" ]] && NA='http://tx.fhir.org'

# A run that skipped generation (-g), validation (-h), used -rapido (-j), or ran
# without a terminology server (-t) reports fewer QA messages than a full run.
# Its report is not comparable with a full run's, so -q must not diff it against
# the baseline or overwrite the baseline with it. Measured 2026-10-13: a full
# run reports 2 errors / 4 warnings / 1 info / 1 broken link; the same tree with
# generation and validation off reports 1 / 2 / 0 / 0.
if [[ -n "$GEN_OFF" || -n "$VAL_OFF" || -n "$RAPIDO" || "$NA" == "N/A" ]]; then
  QA_RUN_KIND="partial"
else
  QA_RUN_KIND="full"
fi
ig_path="$HOME/Downloads" # **THE LOCATION OF `org.hl7.fhir.igpublisher.jar` NEEDS TO BE CONFIGURED FOR YOUR LOCAL INSTALL **  ====
inpath=input
examples="$inpath"/examples
resources="$inpath"/resources
fsh_resources="fsh-generated/resources"
data="$inpath"/data

if [[ $IN_DOCS ]]; then
  outpath=docs
else
  outpath=output
fi
# Defines the strings to remove
my_strings=(
    '<span class="bg-success" markdown="1">'
    '</span><!-- new-content -->'
    '<div class="bg-success" markdown="1">'
    '</div><!-- new-content -->'
)
# define csv file to clear "Is_New" column data
# !! THE FIRST COLUMN DATA WILL BE CLEARED FROM THESE FILE WHEN PROCESSED
# csv_files_to_clean=(
#   input/data/additional-uscdi-requirements.csv
#   input/data/profile_metadata.csv
#   input/data/provenance-elements.csv
#   input/data/search_requirements.csv
#   )
# special is_new columns in input/data/provenance-elements.csv to clear
# prov_csv_columns_clean=(
# Target_Resource_1_is_new
# Target_Resource_2_is_new
# Target_Resource_3_is_new
# Target_Resource_4_is_new
# Target_Resource_5_is_new
# Target_Resource_6_is_new
# Target_Resource_7_is_new
# Target_Resource_8_is_new
# )
# ===================================

echo "================================================================="
echo "-d flag if output in "docs" folder =  $IN_DOCS"
echo "current directory = $PWD"
echo "outpath=$outpath"
echo "inpath=$inpath"
echo "================================================================="

echo "================================================================="
echo === Publish $SOURCE IG!!! $(date -u) ===
echo "================================================================="
echo "Optional Parameters"
echo "================================================================="
echo "-b Turns on debugging (this produces extra logging, and can be verbose) = $DEBUG_ON"
echo "-c copy data csv files and created excel files to the image/tables folder = $COPY_CSV"
echo "-d flag if output in "docs" folder = $IN_DOCS"
echo "-e flag to add current version to canonicals 'meta.profile' in examples, 'exampleCanonical' in IG resources and 'definitions' and 'supportedProfiles' in CapStatements = $APP_VERSION"
echo "-f flag to add codesystem-ref-all-list.csv and valueset-ref-all-list.csv to data folders to process as tables = $TERMINOLOGY_TABLES"
echo "-g flag to turn off narrative generation to speed up build times = $GEN_OFF"
echo "-h flag to turn off validation to speed up build times = $VAL_OFF"
echo "-i parameter for running only ig-publisher = $IG_PUBLISH"
echo "-j parameter for speeding up the build = $RAPIDO"
echo "-k remove the meta.profile elements from all the examples = $NO_PROFILE"
echo "-l flag to add or update the page-link-list to the input/includes folder (run after successful build before new build) = $PAGE_LINKS"
echo "-n remove the meta.extension elements from all the examples = $NO_META"
echo "-o parameter for running previous version of the igpublisher= $PUB"
echo "-p parameter for downloading latest version of the igpublisher from source = $UPDATE_PUB"
echo "-q Claude QA differential report analysis  =  $VIEW_QA"
echo "-r remove all generated json files = $CLEAR_JSON"
echo "-s parameter for running only sushi = $SUSHI"
echo "-t parameter for no terminology server (run faster and offline)= $NA"
echo "-v view ig home page  in current browser = ./$outpath/index.html  =  $VIEW_OUTPUT"
echo "-x remove change highlighting from all markdown files =  $REM_HIGHLIGHT"
echo "-y tranform all yaml files to json files = $YAML_JSON"
echo "-z delete the template and temp directories before publishing (slows build but needed when rename files and change templates)= $DEL_TEMP"
echo "-C delete the input-cache before publishing (slows build but needed when rename files and change templates)= $DEL_TEMP"
echo "-V update the vsacname-fhiruri-map.csv file for US Core = $VSACURI"
echo "-R create Requirements Resources from csv file = $GEN_REQ"
echo "-L render the Liquid narrative templates and report any that error = $CHECK_LIQUID"
echo "================================================================="
echo getting rid of .DS_Store files since they gum up the igpublisher....
find $PWD -name '.DS_Store' -type f -delete
sleep 1


# TODO .. complete this script to compare CapabilityStatements
# if [ "$FILES" ]; then
#   echo ""
#   echo "===================================================================="
#   echo "Checking resource types in $FILES..."
#   echo ""
#   FOUND_DIFF=false

#   for fileA in $FILES; do
#       nameA=$(basename "$fileA" .json)
#       typesA=$(jq -r '.rest[]?.resource[]?.type // empty' "$fileA" 2>/dev/null | sort -u)

#       for fileB in $FILES; do
#           [ "$fileA" \< "$fileB" ] || continue  # Only compare each pair once
#           nameB=$(basename "$fileB" .json)
#           typesB=$(jq -r '.rest[]?.resource[]?.type // empty' "$fileB" 2>/dev/null | sort -u)

#           # Types in A but not in B
#           while read -r type; do
#               [ -n "$type" ] && echo "❌ [$type] in [$nameA] missing from [$nameB]" && FOUND_DIFF=true
#           done < <(comm -23 <(echo "$typesA") <(echo "$typesB"))

#           # Types in B but not in A
#           while read -r type; do
#               [ -n "$type" ] && echo "❌ [$type] in [$nameB] missing from [$nameA]" && FOUND_DIFF=true
#           done < <(comm -13 <(echo "$typesA") <(echo "$typesB"))
#       done
#   done
#
#   if ! $FOUND_DIFF; then
#       echo "✅ Types are the same in all CapabilityStatements"
#   fi
#   echo "===================================================================="
#   echo ""
#   sleep 1
# fi

if [[ $GEN_REQ ]]; then
  echo "======================================="
  echo "Update Requirements resources"...
  # do not process rows with Conformance = "DEPRECATED
  # use the SHALLNOT extension for Conformance = "SHALL-NOT"


  for role in server client certifying-system; do
    if [ "$role" == "certifying-system" ]; then
      filter='.actor == "Server" and .certifiers_only == "TRUE"'
    elif [ "$role" == "server" ]; then
      filter='.actor == "Server" and .certifiers_only != "TRUE"'
    else
      filter='.actor == "Client"'
    fi

    yq -p=csv -oy --csv-auto-parse=f "
      [.[] |
        .key as \$key |
        select(.key != null and .key != \"\" and .conformance != \"DEPRECATED\") |
        pick([\"key\", \"reference\", \"conformance\", \"conditionality\", \"requirement\", \"certifiers_only\", \"actor\"]) |
        select($filter) |
        .reference = (.reference | split(\",\")| map(trim)) |
        ._reference = (
            [(.reference | to_entries[]) | {
              \"extension\": [
                {
                  \"url\": \"http://hl7.org/fhir/StructureDefinition/narrativeLink\",
                  \"valueUrl\": (.value | sub(\"#.*\", \"#\" + \$key))
                }
              ]
            }]
          ) |
        .conformance = (.conformance | split(\"|\")) |
        with(select(.conformance | contains([\"SHALL-NOT\"]));
          .extension = (.extension // []) + [{
            \"url\": \"http://hl7.org/fhir/tools/StructureDefinition/requirements-statementshallnot\",
            \"valueBoolean\": true
          }] |
          .conformance = [.conformance[] | select(. != \"SHALL-NOT\")]
        ) |
        with(select(.conformance | length == 0);
          del(.conformance)
        ) |

        with(select(.conditionality == \"TRUE\");
          .conditionality = true
        ) |
        with(select(.conditionality != true);
          del(.conditionality)
        ) |
        del(.certifiers_only) |
        del(.actor) |
        del(.context)
      ]
    " "$data"/us_core_requirements.csv > /tmp/statements.yaml

    yq -i '.statement = load("/tmp/statements.yaml")' "${inpath}/resources-yaml/R5Requirements-us-core-${role}.yml"
    echo "updated input/resources-yaml/R5Requirements-us-core-${role}.yml"...
  done

  echo "============= done ! ======================="
  echo ""
fi

if [[ $VSACURI ]]; then
URL="https://cts.nlm.nih.gov/fhir/metadata"
VSACURI_MAP="$data"/vsacname-fhiruri-map.csv
  echo ""
  echo "===================================================================="
  echo "Update $VSACURI_MAP file for US Core"
  echo "VSAC source at $URL"
  #Fetch the JSON and process it with jq to create markdown table
  curl -s "$URL" | jq -r '
  .extension |  # Extract the extensions array
    ["VSAC Code System Name,FHIR URI"] +    # Create CSV header
  (map(    # Process each extension into a table row and sort
    .extension as $ext |
    [$ext[] | select(.url == "name") | .valueString] as $name |   # Get name from valueString where url is "name"
    [$ext[] | select(.url == "system") | .valueUri] as $system |    # Get system from valueUri where url is "system"
    ($name[0] // "N/A") + "," + ($system[0] // "N/A")      # Create CCSV row
  )| sort
    )
    | join("\n")' | tee $outfile      # Join all lines with newlines
  echo "===================================================================="
  echo ""
  sleep 1
fi

if [[ $DEL_TEMP ]]; then
echo "================================================================="
echo rm -r template temp
read -p "Do you want to continue? (y/N) " answer
echo "================================================================="
if [[ "$answer" == "y" ]]; then
    echo "Continuing..."
    rm -r template temp
else
    echo "Operation cancelled by user."
    exit 1
fi
fi

if [[ $DEL_CACHE ]]; then
echo "================================================================="
echo rm -r input-cache
read -p "Do you want to continue? (y/N) " answer
echo "================================================================="
if [[ "$answer" == "y" ]]; then
    echo "Continuing..."
    rm -r input-cache
else
    echo "Operation cancelled by user."
    exit 1
fi
fi

if [[ $COPY_CSV ]]; then
echo "================================================================="
echo cp input/data/*.csv input/images/tables
echo "================================================================="
cp input/data/*.csv input/images/tables
echo "================================================================="
echo convert input/data/*.csv to excel and move to input/images/tables
echo "================================================================="
for csv_file in $(find input/data/*.csv -type f)
do
echo convert $csv_file to ...
excel_file=input/images/tables/$(basename $csv_file)
excel_file=${excel_file%.*}.xlsx
pyexcel transcode $csv_file $excel_file
echo $excel_file
done
fi

if [[ $REM_HIGHLIGHT ]]; then
  echo "================================================================="
  echo "============ remove new-content highlighting  ==================="
  echo "================================================================="
  echo ""
  echo "=== this will remove new-content highlighting from all markdown files, and ==="
  echo "=== comments out all lines in input/data/new_stuff.yml, and ==="
  read -p "Do you want to continue? (y/N) " answer
  if [[ "$answer" == "y" ]]; then
    echo "Continuing..."
    echo "================================================================="
    echo ""

    find "$inpath" -type f -name "*.md" | while read -r file_path; do
        # Process each file
        temp_file=$(mktemp)
        cp "$file_path" "$temp_file"
        for string_to_remove in "${my_strings[@]}"; do
            # Use sed to remove the string from the file (macOS-compatible)
            sed -i '' "s|$string_to_remove||g" "$file_path"
        done
        if ! cmp -s "$file_path" "$temp_file"; then
            echo "Tags removed successfully from file: $file_path!"
        fi
    done
    # echo "================================================================="
    # echo "Comment out all lines in `input/data/new_stuff.yml`..."
    # echo "================================================================="
    sed -i '' 's/^[^#]/#&/' "$data"/new_stuff.yml
    # echo "================================================================="
    # echo "Clear all Is_New first column data from `input/data/` csv files" NOT USED BREAKS CSV with embedded commas and quotes  TODO debug
    # echo "================================================================="
    # echo ""
    # for file in "${csv_files_to_clean[@]}"; do
    #     sed -i '' '1!s/^[^,]*//' "$file"
    # done
    # echo "================================================================="
    # echo "Clear all special is_new columns in input/data/provenance-elements.csv" NOT USED BREAKS CSV with embedded commas and quotes  TODO debug
    # echo "================================================================="
    # echo ""
    # prov_csv=input/data/provenance-elements.csv
    # # sed -i '' $'s/\r$//' "$prov_csv" # At the start: convert whatever line endings to Unix to prevent a Jekyll error
    # for col_name in "${prov_csv_columns_clean[@]}"; do
    #     COL=$(head -1 "$prov_csv" | tr ',' '\n' | grep -n "^${col_name}$" | cut -d: -f1)
    #     if [ -n "$COL" ]; then
    #         awk -F',' -v OFS=',' -v col="$COL" 'NR > 1 { $col = "" } 1' "$prov_csv" > tmp.csv && mv tmp.csv "$prov_csv"
    #     else
    #         echo "Column '$col_name' not found!"
    #     fi
    # done
    echo "================================================================="
    echo "done! Check for any remaining tags or new content highlighting manually and remove new content flags from the csv files"
    echo "================================================================="
    echo ""
    sleep 1
  else
      echo "Operation cancelled by user."
      echo "================================================================="
      echo ""
      sleep 1
      exit 1
  fi
fi

if [[ $PAGE_LINKS ]]; then
  echo "================================================================="
  echo "Add or update the page-link-list to the input/includes folder"
  echo "It excludes .xml.html, .json.html, and .ttl.html files (alternate format representations)."
  echo "SINCE IT READS THE PAGES DATA FILES, RUN AFTER SUCCESSFUL BUILD AND BEFORE SUSHI"
  echo "jq -r 'to_entries[] | select(.key | endswith(\".xml.html\") or endswith(\".json.html\") or endswith(\".ttl.html\") | not) | \"[\(.value | .title)]: \(.key)\"' temp/pages/_data/pages.json > input/includes/page-link-list.md"
  echo "================================================================="

  # Write boilerplate warning and jq output to the file
  {
    echo "<!--"
    echo "WARNING: This file is auto-generated by the page-link-list script"
    echo "at https://github.com/Healthedata1/Healthedata1-Sandbox/blob/master/publish.sh"
    echo "It is created from temp/pages/_data/pages.json using jq to extract page titles and relative URLs"
    echo "to create a link-list file."

    echo "DO NOT EDIT THIS FILE MANUALLY, as changes will be overwritten on the next build."
    echo "To update links, modify the source data in the pages and sushi-config.yaml file and rebuild the site."
    echo "-->"
    echo ""
    jq -r 'to_entries[] | select(.key | endswith(".xml.html") or endswith(".json.html") or endswith(".ttl.html") | not) | "[\(.value | .title)]: \(.key)"' temp/pages/_data/pages.json
  } > input/includes/page-link-list.md
fi

if [[ $YAML_JSON ]]; then

  for dir in resources examples; do

    if test -d $inpath/$dir-yaml; then

    # ---------------------------------------------------------------------
    # DISABLED 2026-10-13. This check never ran, and fixing it would not help.
    #
    # It was intended to catch a JSON file edited directly instead of its YAML
    # source, so -y would not silently overwrite a collaborator's work.
    #
    # Why it never ran: it looks for "${base}.yaml" while every source file in
    # this repo is ".yml". The existence test below therefore failed for all
    # 332 files and "continue" fired every time, so zero comparisons were ever
    # performed and the "Aborting!" branch was unreachable.
    #
    # Why fixing the extension would not help: the heuristic is "JSON committed
    # more recently than its YAML", but -e stamps version canonicals and -n
    # strips meta extensions, both of which rewrite the JSON after generation.
    # The JSON being newer is therefore the normal state after any -ien build,
    # not evidence of a hand edit. With the extension corrected, 254 of 332
    # files flag, 217 of them from a single version-bump commit.
    #
    # The orphaned-JSON check further down ("Checking for JSON files with no
    # corresponding YAML source") covers the failure that actually occurs: a
    # renamed YAML leaving its old JSON behind. Detecting a genuine hand edit
    # would need a content comparison (regenerate from YAML into a temp file
    # and diff, allowing for the -e and -n transformations), not a timestamp.
    # ---------------------------------------------------------------------
#    echo ""
#    echo "========================================================================"
#    echo "Check for any $dir JSON files commited after $dir YAML files "
#    echo "if not, overwrite all yaml created json files in $dirs directory with"
#    echo "the yaml files from the $dirs-yaml directory"
#    echo "using yq see https://github.com/mikefarah/yq"
#    echo "========================================================================"
#    echo ""
#
#
#    for json_file in $inpath/$dir/*.json; do
#        base=$(basename "$json_file" .json)
#        yaml_file="$inpath/$dir-yaml/${base}.yaml"
#
#        [[ ! -f "$yaml_file" ]] && continue
#
#        json_time=$(git log -1 --format="%ct" -- "$json_file" 2>/dev/null || echo 0)
#        yaml_time=$(git log -1 --format="%ct" -- "$yaml_file" 2>/dev/null || echo 0)
#
#    # Check for committed changes (staged or unstaged)
#        if [[ "$json_time" -gt "$yaml_time" ]]; then
#            echo "⚠️  $json_file was committed MORE RECENTLY than $yaml_file"
#            echo "   JSON: $(git log -1 --format='%ci %s' -- "$json_file")"
#            echo "   YAML: $(git log -1 --format='%ci %s' -- "$yaml_file")"
#            echo ""
#            echo "❌ Aborting! Reconcile this file before regenerating."
#            exit 1
#        fi
#    done

      for yaml_file in $(find $inpath/$dir-yaml/*.yml -type f) # -mtime -$days)
      do
          base=$(basename "$yaml_file" .yml)
          json_file="$inpath/$dir/${base}.json"
          echo "Converting $yaml_file → $json_file"
          yq -o=json < $yaml_file > $json_file
      done
    fi
    done
  fi

if [[ $UPDATE_PUB ]]; then
puburl=https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar
path1="$ig_path"/org.hl7.fhir.igpublisher.jar
path2="$ig_path"/org.hl7.fhir.igpublisher-old.jar
echo "========================================================================"
echo "Downloading most recent publisher from $puburl to:"
echo ~/Downloads/org.hl7.fhir.igpublisher.jar
echo "... it's ~200 MB, so this may take a bit"
echo "========================================================================"
mv $path1 $path2
curl -L $puburl -o $path1
echo "===========================   Done  ===================================="
sleep 3
fi


if [[ $SUSHI ]]; then
  echo "================================================================="
  echo "start sushi ......................................................"
  rm -rf output docs
  sushi .
  inpath=fsh-generated/resources

  for ig_json in fsh-generated/resources/ImplementationGuide*.json
    do
    ig_yaml='input/data/ig.yml'
    echo ""
    echo "========================================================================"
    echo " copy $ig_json to root ..."
    cp $ig_json .
    echo " Using yq convert $ig_json and copy to $ig_yaml ..."
    yq -p=json -o=yaml < $ig_json > $ig_yaml
    done
  echo "======================= ... done =========================================="
  echo ""
fi

if [[ $NO_META ]]
then
  if compgen -G "$examples/*.json" > /dev/null
  then
    echo "================================================================="
    echo "===remove the meta extension element from all the examples in $examples==="
    echo "================================================================="
    tmp=$(mktemp -d -d ./input/_examples)
    # echo "========= tmp is $tmp ==========="
    for file in $examples/*.json
      do
        # echo "file is $file"
        # echo "basename is $(basename $file)"
                jq 'if (.meta.profile or .meta.lastUpdated) then del(.meta.extension) else del(.meta) end' < $file > $tmp/$(basename $file)
      done
    mv -f $tmp/*.json $examples
    rm -rf $tmp
  else
      echo "================================================================="
      echo "===no files in the $examples folder ==="
      echo "================================================================="
  fi
fi

if [[ $NO_PROFILE ]]
then
  if compgen -G "$examples/*.json" > /dev/null
  then
    echo "=========================================================================="
    echo "===remove the meta profile element from all the examples in $examples ==="
    echo "===side effect is removal of meta extension if no source or lastupdated?  ======"
    echo "========================================================================="
    tmp=$(mktemp -d -d ./input/_examples)
    # echo "========= tmp is $tmp ==========="
    for file in $examples/*.json
      do
      jq  'walk(if type=="object" and  (.source or .lastUpdated)
        then del(.profile)
        else if type=="object" and .meta.profile
        then del(.meta)
        else . end
         end)' < $file > $tmp/$(basename $file)
      done
    mv -f $tmp/*.json $examples
    rm -rf $tmp
  else
      echo "================================================================="
      echo "=== no files in the $examples folder ==="
      echo "================================================================="
  fi
fi

if [[ $APP_VERSION ]]; then
    echo "================================================================="
    echo "=== update example files meta profiles to the current version  ==="
    echo "=== and update IG.yml file example Canonicals to the current version =="
    echo "=== and update CapabilityStatement canonicals to the current version =="
    echo "================================================================="
    IGJSON=$(echo ImplementationGuide*.json)
    echo "========= IGJSON is $IGJSON ==========="
    tmp=$(mktemp -d _examples)

    trap 'rm -rf "$tmp"' EXIT # Clean up on exit
    echo "========= tmp is $tmp ==========="
    ver=$(jq -r '.version' $IGJSON)
    # canon=$(jq -r '.url | split("/ImplementationGuide/")[0]' $IGJSON)
    canon=http://hl7.org/fhir/us/core/
    echo "========= canon is $canon ==========="
    echo "========= current version is $ver ==========="
    for file in $examples/*.json
      do
        [ -f "$file" ] || continue     # Skip if the glob didn't match any files (the pattern itself is returned)
        jq --arg ver "$ver" --arg canon "$canon" '
          if .meta.profile? then
            .meta.profile |= map(
              if contains($canon) then sub("(\\|[^|]*$)|$"; "|" + $ver) else . end
            )
          else . end
          ' < "$file" > "$tmp/$(basename "$file")"
        done
    if ls "$tmp"/*.json >/dev/null 2>&1; then  # Skip if glob didn't match (no examples)
        mv -f "$tmp"/*.json "$examples"
    fi
    echo "========= example files meta.profile updated to $ver ==========="
    # update ig json file
    jq --arg ver "$ver" --arg canon "$canon" '
      .definition?.resource[] |=
        if .exampleCanonical != null and (.exampleCanonical | contains($canon)) then
         .exampleCanonical |= sub("(\\|[^|]*$)|$"; "|" + $ver)
        else . end
           ' "$IGJSON" > "$tmp/ig.json"
    mv -f "$tmp"/*.json "$IGJSON"
    echo "========= IG.json definition.resource.exampleCanonicals updated to $ver ==========="
    # update capstatement supportedProfile[], operation[].definition  ,and searchParam[].definition
    for file in input/resources/CapabilityStatement*.json
      do
        [ -f "$file" ] || continue     # Skip if the glob didn't match any files (the pattern itself is returned)
        jq --arg ver "$ver" --arg canon "$canon" '
          ( .rest[]?.resource[]?.operation[]?.definition,
          .rest[]?.resource[]?.searchParam[]?.definition,
          .rest[]?.resource[]?.supportedProfile[]? ) |=
            if . != null and contains($canon) then
              sub("(\\|[^|]*$)|$"; "|" + $ver)
            else . end
            ' < "$file" > "$tmp/$(basename "$file")"
      done
    if ls "$tmp"/*.json >/dev/null 2>&1; then  # Skip if glob didn't match (no capstatements)
        mv -f "$tmp"/*.json "$resources"
    fi
    echo "========= Cap Statement files canonicals updated to $ver ==========="
    # rm -rf "$tmp"
fi

if [[ $CHECK_LIQUID ]]; then
  ./check_liquid.sh
  echo ""
fi

if [[ $IG_PUBLISH ]]; then

  # Preflight: a broken Liquid narrative template does not fail the build and
  # emits no QA message -- the publisher silently replaces the resource's whole
  # narrative with one "Exception generating Narrative" line. Catch it here, in
  # a couple of seconds, rather than after a twelve minute build. Advisory only:
  # it must not stop a build over a missing jar or a java version.
  ./check_liquid.sh || echo "⚠️  continuing the build with a broken Liquid template"
  echo ""

  files=()                                        # 1. Start with an empty array
  for dir in "$resources" "$fsh_resources" "$examples"; do  # 2. Loop over each directory
    for f in "$dir"/*.json; do                    # 3. Loop over each .json glob match
      [ -f "$f" ] && files+=("$f")                # 4. Only add it if it's a real file
    done
  done

  echo ""
  echo "===================================================================="
  echo "Check for BOM in CSV Data Files ..."
  for file in "$data"/*.csv; do
    if head -c 3 "$file" | grep -q $'\xef\xbb\xbf'; then
        echo "BOM found in $file — removing..."
        sed -i '' '1s/^\xEF\xBB\xBF//' "$file"
        echo "Done."
    else
        echo "No BOM found in $file"
    fi
  done
  echo "====================================================================="
  echo ""
  sleep 1

  echo ""
  echo "===================================================================="
  echo "Check CSV Content - US CORE ONLY ..."
  echo "====================================================================="
  echo ""
  sleep 1

  CSV_FILE="$data"/profile_metadata.csv
  echo "CSV = $CSV_FILE"
  if [ -f "$CSV_FILE" ]; then
    echo ""
    echo "===================================================================="
    echo "Checking for missing resources in $CSV_FILE..."
    echo ""
    missing_count=0
    for filepath in "$resources"/StructureDefinition-*.json; do
        resource_id=$(jq -r '.id' "$filepath")
        if ! awk -F',' -v id="$resource_id" '$3 == id {found=1; exit} END {exit !found}' "$CSV_FILE"; then
            echo "❌ Missing: $resource_id (from $(basename "$filepath"))"
            ((missing_count++))
        fi
    done
    [ $missing_count -eq 0 ] && echo "✅ All resource IDs are present in the CSV_FILE!" || echo "⚠️  Found $missing_count resource(s) missing from CSV_FILE"
    echo "====================================================================="
    echo ""
    sleep 1
  fi

  CSV_FILE="$data"/provenance-elements.csv
  prov_page="$inpath"/pagecontent/basic-provenance.md
  echo "CSV = $CSV_FILE"
  if [ -f "$CSV_FILE" ]; then
    echo ""
    echo "===================================================================="
    echo "Checking for missing profiles in $CSV_FILE..."
    echo ""
    # A profile belongs in one of two places: a row in provenance-elements.csv giving
    # its Five Ws author element, or the "omitted because they are typically not
    # associated with individual authorship" list on the Basic Provenance page. That
    # prose list is the exclude list, so read it here instead of reporting those
    # profiles every run. Extensions are skipped outright - they are not profiles and
    # never carry an author.
    #
    # Before this, the check reported 22 StructureDefinitions every build: 15
    # extensions and 7 already on that list. A genuinely missing profile could not be
    # picked out of that, and one was missed - the US Core Appointment Profile was
    # added in 10.0.0-ballot with no row and no exclude-list entry.
    if [ -f "$prov_page" ]; then
      excluded=$(awk '
        /^The following US Core Profiles were omitted/ { inlist = 1; next }
        inlist && /^[[:space:]]*-[[:space:]]/ {
          line = $0
          gsub(/<[^>]*>/, "", line)                       # span wrappers and <!-- new-content -->
          sub(/^[[:space:]]*-[[:space:]]*/, "", line)
          gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
          if (line != "") print line
          next
        }
        inlist && /^[[:space:]]*$/ { next }               # blank lines within the block
        inlist { exit }                                   # first non-bullet ends the list
      ' "$prov_page")
    else
      excluded=""
      echo "⚠️  $prov_page not found - the exclude list cannot be read"
    fi
    missing_count=0
    excluded_count=0
    for filepath in "$resources"/StructureDefinition-*.json; do
        [ "$(jq -r '.type' "$filepath")" = "Extension" ] && continue
        resource_url=$(jq -r '.url' "$filepath")
        resource_title=$(jq -r '.title' "$filepath")
        if awk -F',' -v id="$resource_url" '$8 == id {found=1; exit} END {exit !found}' "$CSV_FILE"; then
            continue
        fi
        if [ -n "$excluded" ] && printf '%s\n' "$excluded" | grep -qxF "$resource_title"; then
            excluded_count=$((excluded_count + 1))
            continue
        fi
        echo "❌ Missing: $resource_title (from $(basename "$filepath"))"
        echo "      either add a row to $(basename "$CSV_FILE") with its Five Ws author element,"
        echo "      or add it to the \"not associated with individual authorship\" list in $(basename "$prov_page")"
        missing_count=$((missing_count + 1))
    done
    echo ""
    echo "   $excluded_count profile(s) excluded by $(basename "$prov_page"); extensions not checked"
    [ $missing_count -eq 0 ] && echo "✅ Every profile is either in the CSV_FILE or on the exclude list!" || echo "⚠️  Found $missing_count profile(s) in neither place"
    echo "====================================================================="
    echo ""
    sleep 1
  fi

  CSV_FILE="$data"/uscdi-table.csv
  echo "CSV = $CSV_FILE"
  if [ -f "$CSV_FILE" ]; then
    echo ""
    echo "===================================================================="
    echo "Checking for missing profiles in $CSV_FILE..."
    echo ""
    missing_count=0
    for filepath in "$resources"/StructureDefinition-*.json; do
        resource_url=$(jq -r '.url' "$filepath")
        resource_title=$(jq -r '.title' "$filepath")
        if ! awk -F',' -v id="$resource_title" '(index($3, id) || index($6, id)) {found=1; exit} END {exit !found}' "$CSV_FILE"; then
            echo "❌ Missing: $resource_title (from $(basename "$filepath"))"
            ((missing_count++))
        fi
    done
    [ $missing_count -eq 0 ] && echo "✅ All profiles are present in the CSV_FILE!" || echo "⚠️  Found $missing_count resource(s) missing from CSV_FILE"
    echo "====================================================================="
    echo ""
    sleep 1
  fi

  CSV_FILE="$data"/search_requirements.csv
  echo "CSV = $CSV_FILE"
  if [ -f "$CSV_FILE" ]; then
    echo ""
    echo "===================================================================="
    echo "Checking for missing resources in $CSV_FILE..."
    echo ""
    missing_count=0
    for filepath in "$resources"/StructureDefinition-*.json; do
        resource_type=$(jq -r '.type' "$filepath")
        if ! awk -F',' -v id="$resource_type" '$3 == id {found=1; exit} END {exit !found}' "$CSV_FILE"; then
            echo "❌ Missing Resource Type: $resource_type (from $(basename "$filepath"))"
            ((missing_count++))
        fi
    done
    [ $missing_count -eq 0 ] && echo "✅ All resource Types are present in the CSV_FILE!" || echo "⚠️  Found $missing_count resource(s) missing from CSV_FILE"
    echo "====================================================================="
    echo ""
    sleep 1
  fi

  echo ""
  echo "===================================================================="
  echo "Checking JSON files ..."
  echo "====================================================================="
  echo ""
  sleep 1

  if [ ${#files[@]} -eq 0 ]; then
  echo "✅ No JSON files found to check"
  else
    echo "# ================================================="
    echo "# ==== checking if All JSON files are valid.  ====="
    echo "# ================================================="

    for file in "${files[@]}"    #"$examples"/*.json "$resources"/*.json fsh-generated/resources/*.json
    do
        [ -f "$file" ] || continue # Skip if the glob didn't match any files (the pattern itself is returned)
        if ! jq . "$file" > /dev/null; then
            echo "❌ ERROR: Invalid JSON in $file"
            echo "jq says: $(jq . "$file" 2>&1 >/dev/null | sed 's/^/    /')"
            exit 1
        fi
    done
    echo "✅ All JSON files are valid."
    sleep 1

    echo "# ================================================="
    echo "# ==== checking for duplicate resource ids in JSON files.  ====="
    echo "# ================================================="

    output=$(jq -n -r '
      [inputs | {resourceType, id, file: input_filename}] |
      group_by({resourceType, id}) |
      map(select(length > 1)) |
      if length == 0 then
        "✅ No duplicates resource ids found"
      else
        "❌ Duplicates resource ids found:\n" + (
          map(
            "\n🔄 Resource: \(.[0].resourceType)/\(.[0].id) (\(length) copies)" +
            "\n  📁 Files:" +
            (map("\n    - \(.file)") | join(""))
          ) | join("")
        )
      end
    ' "${files[@]}") #"$resources"/*.json "$fsh_resources"/*.json $examples/*.json)

    echo "$output"

    # Exit with error code if duplicates found
    if [[ "$output" == *"❌"* ]]; then
      exit 1
    fi
    sleep 1

    echo "# ================================================="
    echo "# ==== checking for nulls in JSON files.  ====="
    echo "# ================================================="

    for file in "${files[@]}" #"$examples"/*.json "$resources"/*.json fsh-generated/resources/*.json
    do
        [ -f "$file" ] || continue # Skip if the glob didn't match any files (the pattern itself is returned)
        path=$(jq -r 'paths(type == "null" or (type == "array" and length == 0)) | join(".")' "$file" 2>/dev/null | head -1)
        if [ -n "$path" ]; then
            # Found something bad
            echo "❌ Error: Found null or empty array in $file at: $path"
            exit 1
        fi
    done
      echo "✅ No null values or empty arrays."
    sleep 1
  fi

  echo ""
  echo "===================================================================="
  echo "Checking for JSON files with no corresponding YAML source ..."
  echo "====================================================================="
  echo ""
  # Both YAML-sourced directories. SearchParameters are authored directly as
  # JSON and have no YAML source by design, so skip them; without that, all 110
  # of them report every run and a real orphan is lost in the noise.
  orphan_count=0
  for dir in resources examples; do
    for json_file in "$inpath/$dir"/*.json; do
      [ -e "$json_file" ] || continue
      base=$(basename "$json_file" .json)
      case "$base" in SearchParameter-*) continue;; esac
      if [ ! -f "$inpath/$dir-yaml/${base}.yml" ]; then
        echo "⚠️  No YAML source for $json_file"
        ((orphan_count++))
      fi
    done
  done
  if [ $orphan_count -eq 0 ]; then
    echo "✅ Every generated JSON has a YAML source."
  else
    echo ""
    echo "⚠️  Found $orphan_count orphaned JSON file(s)."
    echo "   -y regenerates but never deletes, so a renamed or removed YAML"
    echo "   source leaves its JSON behind. The orphan keeps the same resource"
    echo "   id as the file now generated under the new name, which the IG"
    echo "   Publisher sees as a duplicate id. Delete the orphan, then re-run -y."
  fi
  echo "====================================================================="
  echo ""
  sleep 1

echo "# ====================================================================="
echo "# ==== remove meta from input/resources/Parameters-manifest.json  ====="
echo "# ==== to make the rendering all nice n pretty like  ====="
echo "# ====================================================================="

jq 'del(.meta)' input/resources/Parameters-manifest.json > /tmp/p.json \
&& mv /tmp/p.json input/resources/Parameters-manifest.json

echo "================================================================="
echo getting path = ...................................................
path="$ig_path"/org.hl7.fhir.igpublisher.jar
if [[ $PUB ]]; then
path="$ig_path"/org.hl7.fhir.igpublisher-old.jar
fi
echo $path
echo "================================================================="

  echo "================================================================="
  echo "=== run the just the igpublisher ==="
  echo "==To run in command line mode, run the IG Publisher like this:=="
  echo "===java -Xmx12G -Dfile.encoding=UTF-8 -jar publisher.jar -ig [source] -no-sushi (-tx [url]) (-packages [directory]) (-generation-off)
(-validation-off) (-debug)
parameters:==="
  echo "================================================================="
    echo java -Xmx12G -Dfile.encoding=UTF-8 -jar ${path} -ig ig.ini -tx $NA -no-sushi $GEN_OFF $VAL_OFF $DEBUG_ON $RAPIDO
    java -Xmx12G -Dfile.encoding=UTF-8 -jar ${path} -ig ig.ini -tx $NA -no-sushi $GEN_OFF $VAL_OFF $DEBUG_ON $RAPIDO
fi


if [[ $TERMINOLOGY_TABLES ]]; then
    echo "================================================================="
    echo "======= cp $outpath/valueset-ref-all-list.csv $inpath/data ======"
    echo "======= cp $outpath/codesystem-ref-all-list.csv $inpath/data ===="
    echo "================================================================="
    cp $outpath/valueset-ref-all-list.csv $inpath/data
    cp $outpath/codesystem-ref-all-list.csv $inpath/data
fi

if [[ $VIEW_OUTPUT ]]; then
    echo "=============== open $PWD/$outpath/index.html ================"
    open ./$outpath/index.html
fi

if [[ $VIEW_QA ]]; then
  echo "================================================================="
  echo "=== Claude QA report analysis ==="
  echo "================================================================="

  QA_CURRENT="$outpath/qa-eslintcompact.txt"
  QA_PREV=".qa-eslintcompact_previous.txt"

  if [[ -f "$QA_CURRENT" ]]; then
    # sort current report for a stable, order-independent comparison
    sort "$QA_CURRENT" > /tmp/qa_sorted.txt

    if [[ "$QA_RUN_KIND" == "partial" ]]; then
      echo "====================================================================="
      echo "SKIPPING the QA comparison: this was a partial build"
      [[ "$NA" == "N/A" ]] && TX_NOTE="-tx N/A" || TX_NOTE=""
      echo "  flags:$GEN_OFF$VAL_OFF$RAPIDO${TX_NOTE:+ $TX_NOTE}"
      echo "  A partial run reports fewer checks, so the diff would list"
      echo "  suppressed checks as resolved issues, and the baseline would be"
      echo "  overwritten with a weaker report."
      echo "  The baseline was left unchanged. Re-run a full build (no -g -h -j"
      echo "  -t) and then -q to compare and update it."
      echo "====================================================================="
    else

    if [[ -f "$QA_PREV" ]]; then
      # diff -u so output uses +/- markers matching the prompt (- = resolved, + = new)
      QA_DIFF=$(diff -u "$QA_PREV" /tmp/qa_sorted.txt || true)
    else
      QA_DIFF="(no previous run to compare against)"
    fi

    { echo "=== DIFF FROM LAST BUILD ==="; echo "$QA_DIFF"; } \
    | claude -p "
    You are reviewing changes to a FHIR IG publisher QA report.
    The diff shows what changed since the last build ('+' = new, '-' = resolved).
    List only:
    - Issues resolved since last build
    - New issues introduced since last build
    Be concise, no analysis or recommendations.
    "
   # Save the SORTED report as the baseline for next time (keeps future diffs sorted-vs-sorted)
   cp /tmp/qa_sorted.txt .qa-eslintcompact_previous.txt
    fi
  else
    echo "⚠️  "$QA_CURRENT" not found — skipping QA analysis."
  fi
fi

