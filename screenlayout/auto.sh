#!/usr/bin/env bash


# this scrpit will check if there are enough monitors for setting the ./default.screenlayout.sh. if not, we will execute the ./single.screenlayout.sh
# add a udev rule like this:
# echo 'SUBSYSTEM=="power_supply", RUN+="/home/joel/dotfiles/screenlayout/auto.sh"' > /etc/udev/rules.d/90-dock.rules

[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -en "$0" "$0" "$@" || :

# export XAUTHORITY=/home/joel/.XAUTHORITY

date >> /home/joel/dotfiles/screenlayout/invoked.log 
echo "sleeping"
sleep 5;
echo "working"

num_connected=0
xrr=`xrandr`

grep -q "DP-1-1 connected" <<< ${xrr}
[[ $? -eq 0 ]] && num_connected=$(( $num_connected + 1 ))
grep -q "DP-1-2 connected" <<< ${xrr}
[[ $? -eq 0 ]] && num_connected=$(( $num_connected + 1 ))
grep -q "DP-1-3 connected" <<< ${xrr}
[[ $? -eq 0 ]] && num_connected=$(( $num_connected + 1 ))
echo numconnected_in_auto$num_connected >> /home/joel/dotfiles/screenlayout/invoked.log 
if [[ ${num_connected} -eq 3 ]]; then
    /home/joel/dotfiles/screenlayout/default.screenlayout.sh
    exit 0
else
    /home/joel/dotfiles/screenlayout/single.screenlayout.sh
    exit 0
fi
exit 1
