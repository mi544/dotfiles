#!/usr/bin/env bash

current_temp=$(xsct | sed 's#.* \([[:digit:]]\)#\1#')
if [ $current_temp -gt 2500 ]
then
  xsct $((current_temp - $1))
fi
