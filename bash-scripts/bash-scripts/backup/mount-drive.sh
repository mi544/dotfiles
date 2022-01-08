#!/usr/bin/env bash

sudo cryptsetup open /dev/sda1 cryptfun && \
sudo mkdir -p /media && \
sudo mount /dev/mapper/cryptfun /media
