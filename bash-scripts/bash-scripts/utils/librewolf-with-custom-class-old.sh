#!/usr/bin/env bash

# apparently checking for whether pid exists is not enough
# since the window may not yet be in control of a window manager
# deprecated_check_if_librewolf_is_available () {
# while :
# do
#   if ! ps -p $pid > /dev/null
#   then
#     echo w
#     sleep 0.5
#   else
#     echo done
#     break
#   fi
# done
# }

update_win_list () {
  win_list=$(wmctrl -lxp | awk '{print $1":"$3":"$4}')
}

get_all_librewolf_windows () {
  update_win_list
  librewolf_win_list=$(echo "$win_list" | grep '.*\.LibreWolf$')
}

is_librewolf_available () {
  get_all_librewolf_windows
  if [ $(echo "$librewolf_win_list" | wc -l) -gt 0 ]
  then
    return 0
  else
    return 1
  fi
}

manipulate_all_librewolf_windows () {
  get_all_librewolf_windows
  echo "123"
  for line in $librewolf_win_list
  do
    line_wid=$(echo $line | awk -F: '{print $1}')
    line_pid=$(echo $line | awk -F: '{print $2}')
    echo "it's time"
    echo $line_wid
    echo $line_pid
    echo "it's not time"
    xdotool search --all --pid $line_pid --class 'LibreWolf' \
      set_window --class "LibreWolf-$1"
    bspc node $line_wid -d $2
  done
}

librewolf --profile $HOME/.librewolf-profiles/$1 &

while :
do
  is_librewolf_available 
  echo "win $win_list"
  echo
  echo "libwin $librewolf_win_list"
  echo ---
  echo "$(echo \"$librewolf_win_list\" | wc -l)"
  if [ $(echo "$librewolf_win_list" | wc -l) -gt 0 ]
  then
    echo "yes, it's available"
    manipulate_all_librewolf_windows
    break
  else
    echo "no"
    sleep 0.2
  fi
done
