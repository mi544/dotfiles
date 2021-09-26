#!/usr/bin/env bash

if [ $(($(pamixer --get-volume) - $1)) -gt 130 ]
then
  pamixer --set-volume 130 --allow-boost
else
  pamixer -d $1 --allow-boost
fi
