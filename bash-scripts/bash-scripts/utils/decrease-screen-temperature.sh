#!/usr/bin/env bash

current_temp=$(xsct | sed 's#.* \([[:digit:]]\)#\1#')
if [ $current_temp -gt 1800 ]
then
  xsct $((current_temp - 50))
fi
