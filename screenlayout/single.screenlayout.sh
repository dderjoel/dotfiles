#!/usr/bin/env sh
echo "single $(date)" >> /home/joel/dotfiles/screenlayout/invoked.log
xrandr -d :0.0 --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal

for d in $(xrandr | grep disconnected | cut -d" " -f1); do
    xrandr -d :0.0 --output $d --off
done
