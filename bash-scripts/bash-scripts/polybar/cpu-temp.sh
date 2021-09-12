#!/usr/bin/env bash

cpu_temp=$(
  sensors |
    grep "Package id 0:" |
    tr -d "+" |
    awk '{print $4}' |
    sed "s/\.[[:digit:]].*//"
)

echo "CPU - $cpu_temp°C"
