#!/usr/bin/env bash

name="$1"

contents=$(cat "./$name.list")

mkdir -p "./$name"

cd "./$name"
IFS=$'\n'
for line in $(echo "$contents"); do
    readarray -d ^ -t linearr <<<"$line"
    url="${linearr[2]}"
    ytdv "$url"
done
unset IFS
cd ..
