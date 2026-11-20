#!/bin/bash
# exit when any command fails
set -e

echo ""
echo "=========================================================================="
echo "=== check which files changes and the status code in remote master before pulling ============"
echo ""
echo "======== Status Codes =============="
echo "====  modify="M"      # Modified  ===="
echo "====  add="A"         # Added     ===="
echo "====  delete="D"      # Deleted   ===="
echo "====  rename="R"      # Renamed   ===="
echo "====  copy="C"        # Copied   ===="
echo "====  unmerged="U"    # Unmerged (conflict)  ===="
echo "====  typechange="T"  # Type changed (file ↔ symlink)  ===="
echo ""
echo " === Alert when an input/resources/*.json file was edited directly ======="
echo " =========== and the corresponding YAML source file not updated ========= "
echo "=========================================================================="
echo ""

git fetch
changed_files=$(git diff --name-status ...origin)
# changed_files=$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)
# Git status codes
statuses="M A D R C U T"
for file in $changed_files; do  #The unquoted $changed_files triggers word splitting,
  if [[ " $statuses " =~ " $file " ]]; then
    status_code=$file
  elif [[ $file == input/resources/*.json ]]; then
      if ! echo "$changed_files" | grep -q "^${file%.json}.yaml"; then
          echo ""
          echo "⚠️  $file was edited directly! (status code = $status_code)"
          echo "    ℹ️  to reconcile with the YAML file pull and overwrite the YAML in resources-yaml"
          echo ""
      fi
  else echo "ℹ️  changed file = $file (status code = $status_code)"
  fi
done


echo "================================================================="
echo "=== hit 'y' to pull ===="
echo "=== else any other key to abort ==="
echo "================================================================="

read var1

echo "================================================================="
echo "==================== you typed '$var1' ============================"
echo "================================================================="

if [ $var1 == "y" ]; then
  git pull
fi



