#!/bin/sh

#1. xrdb {sys,user} Xresources
#1. execute xinitrc.d/*.sh
#1. numlockx
#1. xset screensaver; display power mgmt, xss-lock command
#1. start i3

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# install numlockx package
numlockx &

# set automatic screen saver timeout to 600seconds (10min)
xset s 600
# set automatic display off to 30min
xset dpms 1800 1800 1800

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
xss-lock --transfer-sleep-lock -- ~/.config/i3/lock_screen.sh &

exec /usr/bin/i3
