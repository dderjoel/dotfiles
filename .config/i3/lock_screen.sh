#!/bin/bash
#revert() {
#  xset dpms 0 0 0
#}
#itrap revert HUP INT TERM
#xset +dpms dpms 0 0 5
#i3lock -e -c 2f343f
ls /tmp/lockpipe* >/dev/null
if [ $? -gt 0 ]; then
    mkfifo /tmp/lockpipe
    mkfifo /tmp/lockpipe2
fi 
import -silent -window root png:/tmp/lockpipe &
notify-send "locking the screen now" --icon="user-away" 
mogrify -blur 0x10 png:- </tmp/lockpipe | composite -gravity South -geometry -20x1200 ~/.config/i3/ricknmorty.png png: /tmp/lockpipe2 
i3lock -n -e -u -c 123456 -i /tmp/lockpipe2 &
#echo $!>~/.i3lock

#revert
