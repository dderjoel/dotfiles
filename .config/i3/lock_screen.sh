#!/usr/bin/env bash

# exiting script, if i3lock is already running
pgrep i3lock && exit 0

# pausing audio
playerctl pause

# pause_dunst
notify-send "Pause notifications" &&
  killall -SIGUSR1 dunst 2>&1

# https://unsplash.com/oauth/applications
T=$(mktemp)
curl \
  -s \
  -H "Authorization: ${ENV_UNSPLASH_KEY}" \
  'https://api.unsplash.com/photos/random?query=dark+sky&orientation=landscape' |
  jq ".urls.raw" |
  xargs curl --create-dirs -o "${T}" &&
  multilockscreen -u "${T}" --dim 40 &

# this way, we can call this script and only update the picture
[[ "${1}" != update ]] && multilockscreen -l

# wait for the upate to be done.
wait
# and remove the downloaded pic, since it's now in ~/.cache, multilockscreen took care of that.
rm "${T}"

# wait for multilockscreen to close and the nunpause dunst
tail --pid="$(pidof multilockscreen)" -f /dev/null && killall -SIGUSR2 dunst
# yes... why use tail?, I was surprised, too
# https://stackoverflow.com/questions/1058047/wait-for-a-process-to-finish#41613532
