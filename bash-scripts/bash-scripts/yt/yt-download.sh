#!/usr/bin/env bash

url="$1"

#playlist="$(basename $(pwd))"
#yt-dlp --print '%(title)s^%(uploader)s^%(webpage_url)s' "$url" | tee -a "../$playlist.list"

id=$(echo $1 | rg -o '(/|v=)([\w-]{11})( |\?|&|$)' -r '$2')

       #--write-comments \
       #-o '%(title)s--%(uploader)s--[%(id)s].%(ext)s' \
       #--cookies "$HOME/cookies.txt" \
yt-dlp --write-info-json \
       --cookies "$HOME/.config/cookies/youtube.txt" \
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
