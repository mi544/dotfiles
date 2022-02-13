#!/usr/bin/env bash

cfg_path="$HOME/.config/wallpapers.list"

rnd_wp_paths=$(find "$HOME/Wallpapers" -regex '.*\.\(jpg\|png|gif\)' | shuf)

echo "$rnd_wp_paths" | wc -l > "$cfg_path" > "$cfg_path"
echo 1 >> "$cfg_path"
echo "$rnd_wp_paths" >> "$cfg_path"
"$(dirname "$0")/change-wallpaper.sh"
