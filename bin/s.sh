#!/bin/bash

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
    create)
        create $2
        ;;
    back)
        checkout $previousBranch
        ;;
    *)
        checkout $1
        ;;
esac