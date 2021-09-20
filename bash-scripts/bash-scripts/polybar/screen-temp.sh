#!/usr/bin/env bash

echo $(xsct | sed 's#.* \([[:digit:]]\)#\1#')
