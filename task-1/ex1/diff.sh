#!/bin/bash

rep_link=$1
branch1=$2
branch2=$3

rep_name=`echo "$rep_link" | sed -r "s/.*\/(.*)\.git/\1/"`

# download repo
git clone $rep_link &> /dev/null

# go to repo
cd $rep_name

# checkout branch1 & branch2 and switch to main
{
    git checkout $branch1
    git checkout $branch2
    git checkout main
} &> /dev/null

# take diff and write output
git diff --name-only $branch1...$branch2 > ../diff.txt
