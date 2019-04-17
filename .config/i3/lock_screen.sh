#!/bin/bash
#revert() {
#  xset dpms 0 0 0
#}
#itrap revert HUP INT TERM
#xset +dpms dpms 0 0 5
#i3lock -e -c 2f343f
notify-send "locking the screen now" --icon="user-away"
import -silent -window root png:- | mogrify -blur 0x10 png:- | composite -gravity South -geometry -20x1200 ~/.config/i3/ricknmorty.png png:- png:- >/tmp/lock.png
i3lock -n -e -u -i /tmp/lock.png &
echo $!>~/.i3lock
#revert
