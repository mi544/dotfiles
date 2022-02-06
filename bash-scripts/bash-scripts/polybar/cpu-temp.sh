#!/usr/bin/env bash

cpu_temp=$(
  sensors |
    grep "Package id 0:" |
    tr -d "+" |
    awk '{print $4}' |
    sed "s/\.[[:digit:]].*//"
)

# or
echo "$(sensors 'k10temp-pci-00c3' |
    rg --only-matching '(\+|-)\d{1,3}\.\d..')"
