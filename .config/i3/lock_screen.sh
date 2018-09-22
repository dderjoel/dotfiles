#!/bin/bash
revert() {
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5
i3lock -e -u -i <(import -silent -window root png:- | mogrify -blur 0x20 png:- | composite -gravity South -geometry -20x1200 ~/.config/i3/ricknmorty.png png:- png:-)
revert
