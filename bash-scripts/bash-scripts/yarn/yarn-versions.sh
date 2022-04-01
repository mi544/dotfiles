#!/usr/bin/env bash

package_name="$1"

yarn info --json "$package_name" | jq '.data.versions'
