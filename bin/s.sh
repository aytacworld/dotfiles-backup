#!/bin/bash

isGitFolder="$(pwd)/.git"

[[ ! -d $isGitFolder ]] && echo "run \"git init\" first" && exit 1

remote="origin"
branch=$(git branch --show-current)
tempFolderName="$HOME/.local/tmp"
foldername="$tempFolderName/$(basename $(pwd))"
previousBranch=$([[ ! -d $tempFolderName ]] && mkdir $tempFolderName; [[ ! -f "$foldername" ]] && touch "$foldername" && echo $branch > "$foldername" || cat "$foldername")

checkout () {
  echo $branch > $foldername
  git checkout $1
}

create () {
  git checkout -b $1
}

commit () {
  git add .
  git commit -m "$1"
}

case $1 in
  commit)
    commit "$2"
    ;;
  pull)
    git pull
    ;;
  push)
    [[ ! -z "$2" ]] && commit "$2"
    git push -u $remote $branch
    ;;
  force)
    git push -f
    ;;
  create)
    create $2
    ;;
  back)
    checkout $previousBranch
    ;;
  squash)
    git rebase -i HEAD~$2
    ;;
  *)
    [ -z "$1" ] && git status || checkout $1
    ;;
esac
