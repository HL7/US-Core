#!/bin/bash
# exit when any command fails
set -e
tmp=$(mktemp -d -d ./input/_examples) && echo "\$tmp = $tmp"
function finish {
  # Your cleanup code here
  echo '=== clean up - rename the input/_fsh folder to input/fsh  ==='
  mv input/_fsh input/fsh && echo 'done!'
  echo '====clean up - copy tmp files to examples folder to restore meta elements ===='
  cp -f $tmp/*.json ./input/examples && echo 'done!'
  echo "====clean up - remove $tmp ===="
  rm -rf $tmp && echo 'removed $tmp from docs directory'
}
trap finish EXIT
trap finsh ERR

while getopts sm option
do
 case "${option}"
 in
 s) SUSHI=true;;
 m) NO_META=true;;
 esac
done

echo "================================================================="
echo "=== commit and load to github for autopublisher ==="
echo "-s parameter for enabling sushi in autopublisher = $SUSHI (default is false)"
echo "-m parameter for enabling meta in autopublisher = $NO_META (default is false)"
echo "================================================================="

echo "================================================================="
echo "=== remove all mkdown from docs directory ==="
echo "================================================================="
ls docs/*.md && rm docs/*.md
ls docs/*.md && echo 'done!'


if ! [[ $SUSHI ]]; then
echo "================================================================="
echo "=== rename the 'input/fsh' folder to 'input/_fsh'  ==="
echo "================================================================="
[[ -d input/fsh ]] && mv input/fsh input/_fsh
fi

if [[ $NO_META ]]; then
echo "================================================================="
echo "===remove the meta element from all the examples==="
echo "================================================================="
cp ./input/examples/*.json $tmp
for file in $tmp/*.json
  do
    jq 'del(.meta)' < $file > ./input/examples/$(basename $file)
  done
fi

echo "================================================================="
echo "=== hit 'a' to commit and push all including untracked files ===="
echo "=== else 'c' for only tracked file or ctrl-c to exit ==="
echo "================================================================="

read var1

echo "================================================================="
echo "==================== you typed '$var1' ============================"
echo "================================================================="

if [ $var1 == "c" ]; then
  git add -u        # stages tracked files only, no commit yet
elif [ $var1 == "a" ]; then
  git add .         # stages everything including untracked
fi

echo "================================================================="
echo "=== running Claude grammar/typo check on staged .md files ==="
echo "================================================================="

DIFF=$(git diff --cached -- '*.md')

if [[ -n "$DIFF" ]]; then
  echo "$DIFF" | claude -p "
You are a proofreader for a Jekyll static site.
Review the following git diff of staged content files.
Check ONLY added lines (starting with '+') for:
- Spelling errors and typos
- Grammar mistakes
- Unclear or broken sentences
Ignore: code blocks, liquid tags ({{ }}), front matter (---), HTML attributes, and JSON.
For each issue output: FILE | LINE | ISSUE | SUGGESTION
If no issues found, output: ✅ No issues found.
"
  echo ""
  read -p "Proceed with commit? (y/n): " grammarcheck
  [[ "$grammarcheck" != "y" ]] && echo "Commit aborted." && exit 1
fi

# Now commit and push for both cases
git commit
git push

