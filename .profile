if [[ -a ~/enable-proxy.sh ]]; then 
	source ~/enable-proxy.sh
	export no_proxy=localhost
fi

# set the typematic delay
# xset t rate _delay_ _rate_
xset r rate 200 30

#check the amount of connected displays and if its work, set the layout for work.
noconnected=$(xrandr | grep " connected" | wc -l)
case "$noconnected" in 
	4)
		file=~/.screenlayout/work3mon.sh
		;;
	2)
		file=~/.screenlayout/home1.sh
		;; 
	esac
	if [[ -a $file ]] ; then
		sh $file
	fi
