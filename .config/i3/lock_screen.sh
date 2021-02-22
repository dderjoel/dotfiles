#!/usr/bin/env bash

#exiting script, if i3lock is already running
pgrep i3lock
[[ ${?} -eq 0 ]] && exit 0;

#pausing audio 
playerctl pause

# https://unsplash.com/oauth/applications
T=`mktemp`
curl \
    -s \
    -H "Authorization: ${ENV_UNSPLASH_KEY}" \
    'https://api.unsplash.com/photos/random?query=dark+sky&orientation=landscape' \
    | jq  ".urls.raw" \
    | xargs curl --create-dirs -o ${T} && \
    multilockscreen -u ${T} --dim 40 &


multilockscreen -l 

#wait for the upate to be done.
wait
#and remove the downloaded pic, since its now in ~/.cache, betterlockscreen took care of that.
rm ${T}
