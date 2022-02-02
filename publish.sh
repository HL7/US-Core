#!/bin/bash
# exit when any command fails
SECONDS=0
NA='http://tx.fhir.org'
# do some work
set -e
while getopts twoplisu: option
do
 case "${option}"
 in
 t) NA='N/A';;
 w) WATCH=1;;
 o) PUB=1;;
 p) UPDATE=1;;
 l) LOAD_TEMPLATE=1;;
 u) TEST_TEMPLATE=$OPTARG;;
 i) IG_PUBLISH=1;;
 s) SUSHI=1;;
 esac
done
echo "================================================================="
echo === Publish $SOURCE IG!!! $(date -u) ===
echo see 'local workflow.md' file for how to use
echo "Optional Parameters"
echo '-t parameter for no terminology server (run faster and offline)= ' $NA
echo '-w parameter for using watch on igpublisher from source default is off = ' $WATCH
echo '-o parameter for running previous version of the igpublisher= ' $PUB
echo '-p parameter for downloading latest version of the igpublisher from source = ' $UPDATE
#echo '-l parameter for downloading HL7 ig template from source = ' $LOAD_TEMPLATE
#echo '-u parameter for downloading test ig template from source or file= ' $TEST_TEMPLATE
echo '-i parameter for running only ig-publisher = ' $IG_PUBLISH
echo '-s parameter for running only sushi = ' $SUSHI
echo ' current directory =' $PWD
echo "================================================================="
echo getting rid of .DS_Store files since they gum up the igpublisher....
find . -name '.DS_Store' -type f -delete
sleep 1

inpath=input
if ls $inpath/resources-yaml/*.yml; then
echo "========================================================================"
echo "convert all yml files in resources-yaml directory to json files"
echo "Python 3.7 and PyYAML, json and sys modules are required"
for yaml_file in $inpath/resources-yaml/*.yml
do
echo $yaml_file
json_file=$inpath/resources/$(basename $yaml_file)
json_file=${json_file%.*}.json
echo $json_file
python3.7 -c 'import sys, yaml, json; json.dump(yaml.full_load(sys.stdin), sys.stdout, indent=4)' < $yaml_file > $json_file
done
fi

if ls $inpath/examples-yaml/*.yml; then
echo "========================================================================"
echo "convert all yml files in examples-yaml directory to examples/json files"
echo "Python 3.7 and PyYAML, json and sys modules are required"
for yaml_file in $inpath/examples-yaml/*.yml
do
echo $yaml_file
json_file=$inpath/examples/$(basename $yaml_file)
json_file=${json_file%.*}.json
echo $json_file
python3.7 -c 'import sys, yaml, json; json.dump(yaml.full_load(sys.stdin), sys.stdout, indent=4)' < $yaml_file > $json_file
done
fi

if ls $inpath/includes-yaml/*.yml; then
echo "======================================================================="
echo "convert all yml files in includes-yaml directory to json files"
echo "Python 3.7 and PyYAML, json and sys modules are required"
for yaml_file in $inpath/includes-yaml/*.yml
do
echo $yaml_file
json_file=$inpath/includes/$(basename $yaml_file)
json_file=${json_file%.*}.json
echo $json_file
python3.7 -c 'import sys, yaml, json; json.dump(yaml.full_load(sys.stdin), sys.stdout, indent=4)' < $yaml_file > $json_file
done
echo "========================================================================"
fi

if [[ $UPDATE ]]; then
puburl=https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar
path1=~/Downloads/org.hl7.fhir.igpublisher.jar
path2=~/Downloads/org.hl7.fhir.igpublisher-old.jar
path3=../../../Downloads/org.hl7.fhir.igpublisher.jar
path4=../../../Downloads/org.hl7.fhir.igpublisher-old.jar
echo "========================================================================"
echo "Downloading most recent publisher from $puburl to:"
echo ~/Downloads/org.hl7.fhir.igpublisher.jar
echo "... it's ~100 MB, so this may take a bit"
echo "========================================================================"
mv $path1 $path2 || mv $path3 $path4
curl -L $puburl -o $path1 || curl -L $puburl -o $path3
echo "===========================   Done  ===================================="
sleep 3
fi

# default is to use local my_framework as template
#template=$PWD/my_framework
#if [[ $LOAD_TEMPLATE ]]; then
#template=hl7.fhir.template
#fi

#if [[ $TEST_TEMPLATE ]]; then
#template=$TEST_TEMPLATE
#fi

#echo "================================================================="
#echo === load the hl7 template by setting $PWD/ig.ini ===
#echo === template parameter to .................................... ===
#echo === $template ===
#echo "================================================================="
#sed -i'.bak' -e "s|^template = .*|template = ${template}|" $PWD/ig.ini

echo "================================================================="
echo getting path = ...................................................
path=~/Downloads/org.hl7.fhir.igpublisher.jar
if [[ $PUB ]]; then
path=~/Downloads/org.hl7.fhir.igpublisher-old.jar
fi
echo $path
echo "================================================================="

if [[ $SUSHI ]]; then
  echo "================================================================="
  echo "start sushi ......................................................"
  #echo "=== rename the 'input/pagecontent/README.md' to 'input/pagecontent/README.txt'  ==="
  #trap "echo '=== rename 'input/pagecontent/README.txt' to 'input/pagecontent/README.md'  ==='; mv input/pagecontent/README.txt input/pagecontent/README.md" EXIT
  #[[ input/pagecontent/README.md ]] && mv input/pagecontent/README.md input/pagecontent/README.txt
  rm -rf output docs
  sushi fsh -o .
  inpath=fsh-generated/resources
  echo "========================================================================"
  echo "convert ig.json to ig.yml and copy to input/data"
  echo "Python 3.7 and PyYAML, json and sys modules are required"
  for ig_json in $inpath/ImplementationGuide*.json
    do
    echo "========== ig_json = $ig_json =========="
    ig_yaml='input/data/ig.yml'
    python3.7 -c 'import sys, yaml, json; yaml.dump(json.loads(sys.stdin.read()), sys.stdout, indent=4)' < $ig_json > $ig_yaml
    echo "========== ig_yaml = $ig_yaml =========="
    done
  echo "........................done with sushi. "
  echo "================================================================="

else

  if [[ $IG_PUBLISH ]]; then
    echo "================================================================="
    echo "=== run the just the igpublisher ==="
    echo "================================================================="
    inpath=fsh-generated/resources
    echo "========================================================================"
    echo "convert ig.json to ig.yml and copy to input/data"
    echo "Python 3.7 and PyYAML, json and sys modules are required"
    for ig_json in $inpath/ImplementationGuide*.json
      do
      echo "========== ig_json = $ig_json =========="
      ig_yaml='input/data/ig.yml'
      python3.7 -c 'import sys, yaml, json; yaml.dump(json.loads(sys.stdin.read()), sys.stdout, indent=4)' < $ig_json > $ig_yaml
      echo "========== ig_yaml = $ig_yaml =========="
      done
    echo "========================================================================"
    sleep 5
    echo "================================================================="
    echo "=== rename the 'input/fsh' folder to 'input/_fsh' ==="
    #echo "=== rename the 'input/data/README.md' to 'input/data/_README.md' ==="
    #echo "=== rename the 'input/pagecontent/README.md' to 'input/pagecontent/.README.md' ==="
    echo "================================================================="
    trap "echo '=== rename the input/_fsh folder to input/fsh and  ==='; mv input/_fsh input/fsh;" EXIT
    #echo '=== rename 'input/pagecontent/.README.md' to 'input/pagecontent/README.md' ===';
    #mv input/pagecontent/.README.md input/pagecontent/README.md;" EXIT
    #echo '=== rename 'input/data/_README.md' to 'input/data/README.md' ===';
    #mv input/data/_README.md input/data/README.md;" EXIT
    [[ -d input/fsh ]] && mv input/fsh input/_fsh
    #[[ input/data/README.md ]] && mv input/data/README.md input/data/_README.md
    #[[ input/pagecontent/README.md ]] && mv input/pagecontent/README.md input/pagecontent/_README.md
    if [[ $WATCH ]]; then
      echo "================================================================="
      echo === run most recent version of the igpublisher with watch on ===
      echo "================================================================="
      java -Xmx2G -jar ${path} -ig ig.ini -watch -tx $NA

    else
      echo "================================================================="
      echo "===run igpublisher just once \(no watch option\)==="
      echo "================================================================="
      echo java -jar ${path} -ig ig.ini -tx $NA
      java -Xmx4G -jar ${path} -ig ig.ini -tx $NA

    fi

  else
    echo "================================================================="
    echo "=== run sushi and igpublisher (default) ===="
    echo "================================================================="
    echo "start sushi ......................................................"
    rm -rf output docs
    sushi fsh -o .
    inpath=fsh-generated/resources
    echo "========================================================================"
    echo "convert ig.json to ig.yml and copy to input/data"
    echo "Python 3.7 and PyYAML, json and sys modules are required"
    for ig_json in $inpath/ImplementationGuide*.json
      do
      echo "========== ig_json = $ig_json =========="
      ig_yaml='input/data/ig.yml'
      python3.7 -c 'import sys, yaml, json; yaml.dump(json.loads(sys.stdin.read()), sys.stdout, indent=4)' < $ig_json > $ig_yaml
      echo "========== ig_yaml = $ig_yaml =========="
      done

    if [[ $WATCH ]]; then
      echo "================================================================="
      echo === run most recent version of the igpublisher with watch on ===
      echo "================================================================="
      java -Xmx2G -jar ${path} -ig ig.ini -watch -tx $NA

    else
      echo "================================================================="
      echo "===run igpublisher just once \(no watch option\)==="
      echo "================================================================="
      echo java -jar ${path} -ig ig.ini -tx $NA
      java -Xmx4G -jar ${path} -ig ig.ini -tx $NA
    fi

  fi


fi
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
