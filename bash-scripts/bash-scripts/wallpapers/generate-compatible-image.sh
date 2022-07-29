#!/usr/bin/env bash

image_path="$1"
screen_size=$RESOLUTION
if [ -z $image_path ]; then >&2 echo "Image path not passed" && exit 1; fi
if [ ! -r $image_path ]; then >&2 echo "File doesn't exist or isn't readable" && exit 1; fi
temp_dir='/tmp/wallpapers'
mkdir -p "$temp_dir"

magick "$image_path" -quality 100 -resize "$screen_size" "$temp_dir/wp-ratio.jpg"
color=$(magick "$temp_dir/wp-ratio.jpg" -resize '1!x1!' txt:- | rg --only-matching '#[\d\w]{6}')
magick "$temp_dir/wp-ratio.jpg" -background $color -gravity center -extent "$screen_size" "$temp_dir/wp-final.jpg"
rm "$temp_dir/wp-ratio.jpg"
echo -n "$temp_dir/wp-final.jpg"
