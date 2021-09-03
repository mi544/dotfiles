#!/usr/bin/env bash

echo "Denver - $(
curl --silent https://vueport.io/api/weather/Denver |
  sed 's/.*"temperature":\([[:digit:]]*\).*/\1/'
)°F"
