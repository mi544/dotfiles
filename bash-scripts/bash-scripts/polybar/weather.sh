#!/usr/bin/env bash

echo "Denver - $(
curl --max-time 5 --retry 5 --retry-delay 5 \
  --silent https://vueport.io/api/weather/Denver |
  sed 's/.*"temperature":\([[:digit:]]*\).*/\1/'
)°F"
