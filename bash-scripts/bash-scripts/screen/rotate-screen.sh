#!/usr/bin/env bash

direction=$1

if [[ $direction == 'portrait-right' ]]; then
  xrandr --output "$MONITOR_P" --rotate normal
  xinput set-prop '04F3224A:00 04F3:237D' --type=float 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
  $HOME/bash-scripts/wallpapers/change-wallpaper.sh
elif [[ $direction == 'portrait-left' ]]; then
  xrandr --output "$MONITOR_P" --rotate inverted
  xinput set-prop '04F3224A:00 04F3:237D' --type=float 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1
  $HOME/bash-scripts/wallpapers/change-wallpaper.sh
elif [[ $direction == 'landscape-inverse' ]]; then
  xrandr --output "$MONITOR_P" --rotate left
  xinput set-prop '04F3224A:00 04F3:237D' --type=float 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
  $HOME/bash-scripts/wallpapers/change-wallpaper.sh
elif [[ $direction == 'landscape' || true ]]; then
  xrandr --output "$MONITOR_P" --rotate right
  xinput set-prop '04F3224A:00 04F3:237D' --type=float 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
  $HOME/bash-scripts/wallpapers/change-wallpaper.sh
fi
