#!/bin/bash

echo "Add what precisely (default --all): "
read WHAT
if [[ -z "$WHAT" ]]; then export WHAT="--all"; fi

echo "Please enter a comment for commit: "
read COMMENT

echo "Please enter a branch for commit (default master): "
read BRANCH
if [ -z "$BRANCH" ]; then
 BRANCH="master"
fi

#update git
git config --global core.excludesFile .gitignore
git remote set-url origin https://github.com/mforde84/salt_vagrant.git 
git add "$WHAT"
git commit -m "$COMMENT $(date +%F)"
git push origin "$BRANCH"
