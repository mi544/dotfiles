#!/usr/bin/env bash

cfg_path="$HOME/.config/nitrogen/bg-saved.cfg"

rnd_wp_path=$(ls -1 "$HOME/Wallpapers" | shuf | head -1)
rnd_wp_path="$HOME/Wallpapers/$rnd_wp_path"

echo $rnd_wp_path >> ~/1.ooo

sed -i 's#file=.*#file='"$rnd_wp_path"'#' "$cfg_path"

sudo --user=mi nitrogen --restore > /home/mi/123123.log
