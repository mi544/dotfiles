#!/usr/bin/env bash

ls -I "README.md" -I "stow.sh" | xargs stow -v --restow
