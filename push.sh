#!/bin/bash
echo PUSH $(date -u)
git status
git add .
git status
git commit
git push
