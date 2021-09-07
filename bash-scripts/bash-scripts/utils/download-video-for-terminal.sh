#!/usr/bin/env bash

# ./this-file.sh <video_url> <out_file_name>

url_list=$(youtube-dl -f "[height<=720]" -g "$1")
direct_url=$(echo $url_list | sed "s/\(.*\) .*/\1/")
ffmpeg -i "$direct_url" -an $HOME/term/$2.mp4
