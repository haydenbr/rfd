#!/bin/bash

title=$1
date=$(date "+%Y-%m-%d")

if [ -z "$title" ]; then
    echo "A title is required to create an new RFD. Run this script as ./scripts/new.sh \"My Cool RFD\""
    exit 1
fi

latest_rfd=$(git ls-remote --heads origin |\
    sed "s?.*refs/heads/??" |\
    grep -e "[0-9]" |\
    sort -r |\
    head -n 1)
next_rfd=$(printf "%04d" $(($latest_rfd + 1)))

git checkout -b $next_rfd

mkdir text/$next_rfd
cat scripts/0000-template.md |\
    sed "s/{TITLE}/$title/" |\
    sed "s/{START_DATE}/$date/" > text/$next_rfd/README.md

git add text/$next_rfd
git commit -m "initial commit for RFD $next_rfd"
git push -u origin $next_rfd