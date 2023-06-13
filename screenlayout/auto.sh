#!/usr/bin/env bash

# this script will check if there are enough monitors for setting the ./default.screenlayout.sh. if not, we will execute the ./single.screenlayout.sh
# add a udev rule like this:

# echo 'SUBSYSTEM=="power_supply", RUN+="/home/user/dotfiles/screenlayout/auto.sh"' >> /etc/udev/rules.d/90-dock.rules

umask 000                  # allow all users to access the file we're about to create
exec 9>"/tmp/${0##*/}.lck" # open lockfile on FD 9, based on basename of argv[0]
umask 022                  # move back to more restrictive file permissions
flock -x -n 9 || exit      # grab that lock, or exit the script early

# continue

# export XAUTHORITY=/home/joel/.XAUTHORITY

date >>~/dotfiles/screenlayout/invoked.log
echo -n "sleeping..."
sleep .5
echo "working"

num_connected=0
xrr=$(xrandr)

for dp in DP-1-1 DP-1-2 DP-1-3; do
  if grep -q "${dp} connected" <<<"${xrr}"; then
    num_connected=$((num_connected + 1))
  fi
done

echo numconnected_in_auto $num_connected >>/home/joel/dotfiles/screenlayout/invoked.log
if [[ ${num_connected} -eq 3 ]]; then
  echo doing default
  ~/dotfiles/screenlayout/default.screenlayout.sh
  exit 0
else
  echo doing single
  ~/dotfiles/screenlayout/single.screenlayout.sh
  exit 0
fi
exit 1
