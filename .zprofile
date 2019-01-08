
#check the amount of connected displays and if its work, set the layout for work.
if [ $(xrandr | grep " connected" | wc -l) -eq 4 ]; then
	sh ~/.screenlayout/work3mon.sh
fi

# start the audiodriver
pulseaudio &

# use as a base the intl-edition of us-querty
# map the caps button to the escape key
# map ALT+oua to german umlauts 
xkbcomp -xkb $DISPLAY ~/.xkbmap_custom


# set the typematic delay
# xset t rate _delay_ _rate_
xset r rate 200 30
