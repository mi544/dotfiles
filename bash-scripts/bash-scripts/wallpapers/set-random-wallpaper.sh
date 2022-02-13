#!/usr/bin/env bash

cfg_path="$HOME/.config/nitrogen/bg-saved.cfg"

rnd_wp_path=$(find "$HOME/Wallpapers" -regex '.*\.\(jpg\|png|gif\)' | shuf -n 1)

sed -i 's#file=.*#file='"$rnd_wp_path"'#' "$cfg_path"

nitrogen --set-zoom-fill --restore
