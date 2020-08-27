#!/bin/bash
# exit when any command fails
set -e
puburl=https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar
path1=/Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar
path2=/Users/ehaas/Downloads/org.hl7.fhir.igpublisher-old.jar
path3=/Users/ehaas/Documents/FHIR/IG-tools/
while getopts yds:tonpw option
do
 case "${option}"
 in
 y) RECONFIG=1;;
 d) DEFN=1;;
 s) SOURCE=${OPTARG};;
 t) NA='N/A';;
 o) PUB=1;;
 n) USEDEF=1;;
 p) UPDATE=1;;
 w) WATCH=1;;
 esac
done
echo "================================================================="
echo === Publish $SOURCE IG!!! $(date -u) ===
echo see 'local workflow.md' file for how to use
echo "Optional Parameters"
echo '-y parameter for updating ig.json file from ig.yml config file (use when changing IG config parameters)= ' $RECONFIG
echo ' for -y parameter need python 3.7 and PyYAML, json and sys modules installed in your environment'
echo '-d parameter = create definitions files  = ' $DEFN
echo '-n parameter = use definitions source directory definition files  = ' $USEDEF
echo '-s parameter = source directory = ' $SOURCE
echo '-t parameter for no terminology server (run faster and offline)= ' $NA
echo '-o parameter for running previous version of the igpublisher= ' $PUB
echo '-p parameter for downloading latest version of the igpublisher from source = ' $UPDATE
echo '-w parameter for using watch on igpublisher from source default is off = ' $WATCH
echo ' current directory =' $PWD
echo "================================================================="
echo getting rid of .DS_Store files since they gum up the igpublisher....
find . -name '.DS_Store' -type f -delete
sleep 1
# git status
if [[ $UPDATE ]]; then
echo "================================================================="
echo === get the latest ig-pub file ===
echo "================================================================="
mv $path1 $path2
# _L flag for redirects
# curl -L https://storage.googleapis.com/ig-build/org.hl7.fhir.publisher.jar -o /Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar
curl -L $puburl -o $path1
sleep 3
fi

if [[ $RECONFIG ]]; then
echo "========================================================================"
echo "updating ig.json file from ig.yml config file"
echo "Python 3.7 and PyYAML, json and sys modules are required"
python3.7 -c 'import sys, yaml, json; json.dump(yaml.full_load(sys.stdin), sys.stdout, indent=4)' < ig.yml > ig.json
echo "========================================================================"
fi

if [[ $DEFN ]]; then
  echo "================================================================="
  echo === run definitions maker with optional source directory name as first argument ===
  echo === create ig.json and ig.xml in $PWD and ../$SOURCE ===
  echo "================================================================="
  python3.5 ${path3}definitions.py $SOURCE
  sleep 3
  git status
fi

if [[ $USEDEF ]]; then
  echo "================================================================="
  echo === use definition files from relative path ../$SOURCE ===
  echo "================================================================="
  cp ../$SOURCE/ig.json $PWD/ig.json
  sed -i "" "s|source/pages|../$SOURCE/source/pages|g" ${PWD}/ig.json
  sed -i "" "s|source/resources|../$SOURCE/source/resources|g" ${PWD}/ig.json
  sed -i "" "s|source/examples|../$SOURCE/source/examples|g" ${PWD}/ig.json
  sleep 3
  git status
fi

if [[ $WATCH ]]; then
  echo "================================================================="
  echo ===un most recent version of the igpublisher with watch on ===
  echo "================================================================="
  java -jar ${path1} -ig ig.json -watch -tx $NA
elif [[ $PUB ]]; then
  echo "================================================================="
  echo === run last known good version of the igpublisher run most recent version of the igpublisher ===
  echo "================================================================="
  java -jar ${path2} -ig ig.json -watch -tx $NA
else
  echo "================================================================="
  echo ===run igpublisher just once \(no watch option\)===
  echo "================================================================="
  java -jar ${path1} -ig ig.json -tx $NA
fi
