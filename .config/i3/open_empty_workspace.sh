#!/usr/bin/env bash

#gets numbers of all workspaces which cannot be used (cause their name is not just a number)
mapfile -t occupied < <(i3-msg -t get_workspaces | jq --raw-output 'map(.name / ":"  | select(length > 1)[0] ) | unique | join(" ")')
# now check if there is any number between 1:10 which is not being used already
for candidate in $(seq 1 10); do
  if [[ ! ${occupied[*]} =~ ${candidate} ]]; then
    echo "${candidate}"
    # if so, open new ws
    [[ ${#} -eq 1 && "${1}" == "--move" ]] && i3-msg move container to workspace number "${candidate}"
    i3-msg workspace number "${candidate}"
    break
  fi
done

# if there is some parameter, execute that parameter
[[ ${#} -gt 0 && "${1}" != "--move" ]] && $1
exit 0
