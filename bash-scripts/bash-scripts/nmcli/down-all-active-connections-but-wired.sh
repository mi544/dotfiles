#!/usr/bin/env bash

for connection in $(nmcli c show --active | rg -i -v 'wired' | sed '1d' | awk '{print $1}'); do
    nmcli connection down $connection
done
