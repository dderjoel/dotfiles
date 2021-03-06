#!/usr/bin/env bash

# this scrpit will check if there are enough monitors for setting the ./default.screenlayout.sh. if not, we will execute the ./single.screenlayout.sh
# add a udev rule like this:
# echo 'SUBSYSTEM=="power_supply", RUN+="/home/joel/dotfiles/screenlayout/auto.sh"' > /etc/udev/rules.d/90-dock.rules

# cheers on this guy for the convenience functions https://stackoverflow.com/a/1985512/4361749
LOCKFILE="/var/lock/`basename $0`"
LOCKFD=99

# PRIVATE
_lock()             { flock -$1 $LOCKFD; }
_no_more_locking()  { _lock u; _lock xn && rm -f $LOCKFILE; }
_prepare_locking()  { eval "exec $LOCKFD>\"$LOCKFILE\""; trap _no_more_locking EXIT; }

# ON START
_prepare_locking

# PUBLIC
exlock_now()        { _lock xn; }  # obtain an exclusive lock immediately or fail
exlock()            { _lock x; }   # obtain an exclusive lock
shlock()            { _lock s; }   # obtain a shared lock
unlock()            { _lock u; }   # drop a lock
# End cheers


# Simplest example is avoiding running multiple instances of script.
exlock_now || exit 1

echo "sleeping"
sleep 3;
echo "working"

date >> /home/joel/dotfiles/screenlayout/invoked.log 

xrandr | grep -q DP-1-1
[[ $? -eq 1 ]] && /home/joel/dotfiles/screenlayout/single.screenlayout.sh && exit 0
xrandr | grep -q DP-1-2
[[ $? -eq 1 ]] && /home/joel/dotfiles/screenlayout/single.screenlayout.sh && exit 0 
xrandr | grep -q DP-1-3
[[ $? -eq 1 ]] && /home/joel/dotfiles/screenlayout/single.screenlayout.sh && exit 0 

/home/joel/dotfiles/screenlayout/default.screenlayout.sh && exit 0 

exit 1
