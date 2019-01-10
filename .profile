
#check the amount of connected displays and if its work, set the layout for work.
if [ $(xrandr | grep " connected" | wc -l) -eq 4 ]; then
	sh ~/.screenlayout/work3mon.sh
fi

source ~/enable-proxy.sh
export no_proxy=localhost

# set the typematic delay
# xset t rate _delay_ _rate_
xset r rate 200 30
