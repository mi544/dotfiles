#!/usr/bin/env bash

url="$1"

id=$(echo $1 | rg -o '(/|viewkey=)(ph\w{13})( |\?|&|$)' -r '$2')

yt-dlp --write-info-json \
       --write-thumbnail \
       --embed-thumbnail \
       --merge-output-format mkv \
       --write-auto-subs \
       --embed-subs \
       --embed-metadata \
       --embed-chapters \
       --embed-info-json \
       --xattrs \
       -o '%(title)s--%(uploader)s--[%(id)s].%(ext)s' \
       --retries 500 \
       --fragment-retries 500 \
       --file-access-retries 500 \
       "$url"

IFS=$'\n'
artifacts=$(ls -1 . | rg '\['"$id"'\]' | rg -v '\.(mp4|mkv|flv|webm|mov|avi|mp3|mka|m4a|ogg|opus)$')
echo 'Collecting artifacts..'
mkdir -p ./.artifacts
for file in $(echo "$artifacts"); do 
    mv "$file" ./.artifacts
done
unset IFS
sync
