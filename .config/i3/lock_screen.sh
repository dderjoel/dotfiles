#!/bin/bash
#revert() {
#  xset dpms 0 0 0
#}
#itrap revert HUP INT TERM
#xset +dpms dpms 0 0 5
#i3lock -e -c 2f343f
#import -silent -window root png:/tmp/lockpipe &

#pausing audio
playerctl pause
#mogrify -blur 0x10 png:- </tmp/lockpipe | composite -gravity South -geometry -20x1200 ~/.config/i3/ricknmorty.png png: /tmp/lockpipe2 &
#i3lock -n -e -c 123456 #-i /tmp/lockpipe2 &
betterlockscreen -u $(ls ~/Pictures/lock/* | sort -R | head -n1) -r $(xrandr | grep Screen | awk '{print $8 "x" $10}') &
betterlockscreen -l dim 

#echo $!>~/.i3lock

#revert
