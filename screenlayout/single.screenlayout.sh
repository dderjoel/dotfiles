#!/usr/bin/env sh


# for d in $(xrandr | grep disconnected | cut -d" " -f1); do
# xrandr -d :0.0 --output $d --off
# echo output offed fr $d
# done
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off

# xrandr -d :0.0 --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal
echo "single done $(date)" >> /home/joel/dotfiles/screenlayout/invoked.log

sleep 1 && i3-msg restart
