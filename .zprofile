
#check the amount of connected displays and if its work, set the layout for work.
if [ $(xrandr | grep " connected" | wc -l) -eq 4 ]; then
	sh ~/.screenlayout/work3mon.sh
fi

source ~/enable-proxy.sh

# use as a base the intl-edition of us-querty
# map the caps button to the escape key
# map ALT+oua to german umlauts 
# pipe to dev null to get rid of warnings of missing keycodes
xkbcomp -xkb ~/.xkbmap_custom $DISPLAY 2>/dev/null


# set the typematic delay
# xset t rate _delay_ _rate_
xset r rate 200 30
