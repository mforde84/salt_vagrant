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
eval `ssh-agent -s` > "$PWD"/access/sagent
export ID=`cat "$PWD"/access/sagent | sed 's/Agent pid //g'`
ssh-add "$PWD"/access/salt.rsa
git config --global user.name mforde84
git config --global user.email mforde84@gmail.com
git config --global core.excludesFile .gitignore
git remote set-url origin https://github.com/mforde84/salt_vagrant.git 
	# firewall isn't allowing git@github.com:mforde84/salt_vagrant.git
	# switch to enable rsa key
git add "$WHAT"
git commit -m "$COMMENT $(date +%F)"
git push origin "$BRANCH"
kill -9 "$ID"
