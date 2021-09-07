#!/usr/bin/env bash

echo "Denver - $(
curl --silent https://vueport.io/api/weather/Denver |
  sed 's/.*"temperature":\([[:digit:]]*\).*/\1/'
)°F"


curl --silent --location -g --request GET 'http://api.airvisual.com/v2/nearest_station?lat=39.748&lon=-104.986&key=6ac392ae-0668-43c7-b583-7facd6b361f2'
