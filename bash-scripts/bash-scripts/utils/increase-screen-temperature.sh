#!/usr/bin/env bash

current_temp=$(xsct | sed 's#.* \([[:digit:]]\)#\1#')
if [ $current_temp -lt 6500 ]
then
  xsct $((current_temp + $1))
fi
