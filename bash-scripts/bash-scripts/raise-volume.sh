#!/usr/bin/env bash

if [ $(($(pamixer --get-volume) + 5)) -gt 130 ]
then
  pamixer --set-volume 130 --allow-boost
else
  pamixer -i 5 --allow-boost
fi
