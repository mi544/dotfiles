#!/usr/bin/env bash
address=`echo Nzg6NUU6QTI6NDU6QkU6QjE= | base64 -d`

bluetoothctl disconnect $address
bluetoothctl connect $address
