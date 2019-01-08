
#check the amount of connected displays and if its work, set the layout for work.
if [ $(xrandr | grep " connected" | wc -l) -eq 4 ]; then
	sh ~/.screenlayout/work3mon.sh
fi
