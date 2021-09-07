#!/usr/bin/env bash

video_names=( $( ls $HOME/term/ ) )
random_num=$(($RANDOM % ${#video_names[@]}))
filename_with_extension=${video_names[$random_num]}
filename=${filename_with_extension%%.*}
$HOME/bash-scripts/utils/terminal-play-video.sh $filename
