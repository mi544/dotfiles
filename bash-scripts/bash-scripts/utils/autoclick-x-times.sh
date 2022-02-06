#!/usr/bin/env bash

click_count=$1

sleep 0.5

for i in $(seq 1 $click_count); do
    xdotool click 1
    sleep "0.0$(( 1 + $RANDOM % 3 ))"
done
