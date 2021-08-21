#!/usr/bin/env bash

if [ $(($(pamixer --get-volume) - 5)) -gt 130 ]
then
  pamixer --set-volume 130 --allow-boost
else
  pamixer -d 5 --allow-boost
fi
