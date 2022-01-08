#!/usr/bin/env bash

sync && \
sudo umount /media && \
sudo cryptsetup close cryptfun
