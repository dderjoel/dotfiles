#!/usr/bin/env bash

exec i3-dmenu-desktop \
  --entry-type=name \
  --entry-type=command \
  --show-duplicates \
  --dmenu 'grep -v Qt | rofi -dmenu -i'
