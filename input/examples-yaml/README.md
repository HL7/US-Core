This folder contains project specific source example resource in YAML format.  These are converted to JSON format and add/overwrite to the resource in the resources folder by a custom bash script:


~~~bash
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
~~~
