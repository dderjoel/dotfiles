#!/bin/bash
revert() {
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5
#i3lock -e -c 2f343f
import -silent -window root png:- | mogrify -blur 0x10 png:- | composite -gravity South -geometry -20x1200 ~/.config/i3/ricknmorty.png png:- png:- >/tmp/lock.png
i3lock -e -u -i /tmp/lock.png
revert
