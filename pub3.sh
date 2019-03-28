#!/bin/bash
name="SMART Launch"
path1=/Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar
path2=/Users/ehaas/Downloads/org.hl7.fhir.igpublisher-old.jar
path3=/Users/ehaas/Documents/FHIR/IG-tools/
while getopts ds:to option
do
 case "${option}"
 in
 d) DEFN=1;;
 s) SOURCE=${OPTARG};;
 t) NA='N/A';;
 o) PUB=1;;
 esac
done
echo "================================================================="
echo === Publish $name IG!!! $(date -u) ===
echo see 'local workflow.md' file for how to use
echo "Optional Parameters"
echo '-d parameter = create definitions files  = ' $DEFN
echo '-s parameter = source directory = ' $SOURCE
echo '-t parameter for no terminology server (run faster and offline)= ' $NA
echo '-o parameter for running previous version of the igpublisher= ' $PUB
echo === create ig.json and ig.xml in $PWD and ../$SOURCE ===
echo "================================================================="
echo getting rid of .DS_Store files since they gum up the igpublisher....
find . -name '.DS_Store' -type f -delete
sleep 1
# git status
if [[ $DEFN ]]; then
  echo "================================================================="
  echo === run definitions maker with optional source directory name as first argument ===
  echo "================================================================="
  python3.5 ${path3}definitions.py $SOURCE
  sleep 1
  git status

fi
if [[ $PUB ]]; then
  echo "================================================================="
  echo === run last known good version of the igpublisherrun most recent version of the igpublisher ===
  echo "================================================================="
  java -jar ${path2} -ig ig.json -watch -tx $NA
else
  echo "================================================================="
  echo ===run most recent version of the igpublisher ===
  echo "================================================================="
  java -jar ${path1} -ig ig.json -watch -tx $NA
fi
