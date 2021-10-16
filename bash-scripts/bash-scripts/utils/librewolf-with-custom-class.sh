#!/usr/bin/env bash

librewolf --profile $HOME/.librewolf-profiles/$1 &

while :
do
  win_list=$(wmctrl -lxp | awk '{print $1":"$3":"$4}')
  librewolf_win_list=$(echo "$win_list" | grep '.*\.LibreWolf$')
  librewolf_char_count=$(echo "$librewolf_win_list" | wc -m)

  if [ $librewolf_char_count -gt 3 ]
  then
    for i in $(seq 5)
    do
      wid=$(echo $librewolf_win_list | awk -F: '{print $1}')
      xdotool search --class LibreWolf \
        set_window --class "LibreWolf-$1"
      bspc node $wid -d $2
      sleep 0.3
    done
    break
  else
    sleep 0.2
  fi
done
