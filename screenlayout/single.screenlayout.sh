#!/usr/bin/env bash
set -e

xrandr \
  --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --primary \
  --output DP-1 --off \
  --output DP-2 --off \
  --output HDMI-1 --off \
  --output HDMI-2 --off \
  --output DP-1-1 --off \
  --output DP-1-2 --off \
  --output DP-1-3 --off

sleep .1 && i3-msg restart
