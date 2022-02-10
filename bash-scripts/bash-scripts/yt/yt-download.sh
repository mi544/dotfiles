#!/usr/bin/env bash

url="$1"

playlist="$(basename $(pwd))"
yt-dlp --print '%(title)s^%(uploader)s^%(webpage_url)s' "$url" | tee -a "../$playlist.list"

id=$(echo $1 | rg -o 'watch\?v=(.*?)(&|$)' -r '$1')

       #--write-comments \
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
       -o '%(uploader)s--%(title)s--[%(id)s].%(ext)s' \
       "$url"

IFS=$'\n'
artifacts=$(ls -1 . | rg '\['"$id"'\]' | rg -v '\.(mp4|mkv|flv|webm|mov|avi|mp3|mka|m4a|ogg|opus)$')
mkdir -p ./.artifacts
for file in $(echo "$artifacts"); do 
    mv "$file" ./.artifacts
done
unset IFS
sync

