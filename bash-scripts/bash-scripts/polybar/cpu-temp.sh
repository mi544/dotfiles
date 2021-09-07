#!/usr/bin/env bash

cpu_temp=$(
  sensors |
    grep "Package id 0:" |
    tr -d "+" |
    awk '{print $4}' |
    sed "s/\.[[:digit:]].*//"
)

cpu_message="CPU - $cpu_temp°F"

if [ $cpu_temp -ge 65 ]
then
  echo "! $cpu_message !"
else
  echo $cpu_message
fi
