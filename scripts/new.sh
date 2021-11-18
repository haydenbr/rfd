#!/bin/bash

title=$1
date=$(date "+%Y-%m-%d")

if [ -z "$title" ]; then
    echo "A title is required to create an new RFD. Run this script as ./scripts/new.sh \"My Cool RFD\""
    exit 1
fi

latest_rfd=$(git ls-remote --heads origin |\
    sed "s?.*refs/heads/??" |\
    grep -e "rfd[0-9]" |\
    sort -r |\
    head -n 1 |\
    sed "s?.*rfd??")

next_rfd=rfd$(($latest_rfd + 1))
next_rfd_dir=text/$next_rfd

git checkout -b $next_rfd
mkdir $next_rfd_dir
cat scripts/template.md |\
    sed "s/{TITLE}/$title/" |\
    sed "s/{START_DATE}/$date/" > $next_rfd_dir/README.md

git add $next_rfd_dir
git commit -m "initial commit for $next_rfd"
git push -u origin $next_rfd