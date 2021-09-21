#!/usr/bin/env bash
echo "default $(date)" >> /home/joel/dotfiles/screenlayout/invoked.log
xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-1-1 --mode 1920x1200 --pos 4240x0 --rotate left --output DP-1-2 --primary --mode 2560x1440 --pos 1680x480 --rotate normal --output DP-1-3 --mode 1680x1050 --pos 0x870 --rotate normal

sleep 1 && i3-msg restart
