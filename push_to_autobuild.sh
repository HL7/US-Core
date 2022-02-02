#!/bin/bash
# exit when any command fails
set -e

echo "================================================================="
echo "=== commit and load to github for autopublisher ==="
echo "================================================================="

echo "================================================================="
echo "=== rename the 'input/fsh' folder to 'input/_fsh' ==="
#echo "=== rename the 'input/data/README.md' to 'input/data/_README.md' ==="
#echo "=== rename the 'input/pagecontent/README.md' to 'input/pagecontent/_README.md' ==="
echo "================================================================="
trap "echo '=== rename the input/_fsh folder to input/fsh and  ==='; mv input/_fsh input/fsh;" EXIT
#echo '=== rename 'input/pagecontent/_README.md' to 'input/pagecontent/README.md' ===';
#mv input/pagecontent/_README.md input/pagecontent/README.md;" EXIT
#echo '=== rename 'input/data/_README.md' to 'input/data/README.md' ===';
#mv input/data/_README.md input/data/README.md;" EXIT
[[ -d input/fsh ]] && mv input/fsh input/_fsh
#[[ input/data/README.md ]] && mv input/data/README.md input/data/_README.md
#[[ input/pagecontent/README.md ]] && mv input/pagecontent/README.md input/pagecontent/_README.md

git status

echo "================================================================="
echo "=== hit 'a' to commit and push all including untracked files ===="
echo "=== else 'c' for only tracked file or ctrl-c to exit ==="
echo "================================================================="

read var1

echo "================================================================="
echo "==================== you typed '$var1' ============================"
echo "================================================================="

if [ $var1 == "c" ]; then
  git commit -a
  git push
elif [ $var1 == "a" ]; then
  git add .
  git commit
  git push
fi
