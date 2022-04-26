#!/usr/bin/env bash
set -e

xrandr \
  --output eDP-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output HDMI-1 --off \
  --output HDMI-2 --off \
  --output DP-1-1 --mode 2560x1440 --pos 2098x85 --rotate left --rate 59.95 \
  --output DP-1-2 --mode 3840x2160 --pos 3538x485 --rotate normal --rate 29.98 --primary \
  --output DP-1-3 --mode 1920x1200 --pos 7378x725 --rotate left --rate 59.95

sleep .3 && i3-msg restart >/dev/null
