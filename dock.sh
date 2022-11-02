#!/usr/bin/env bash

# this script is executed as root from the /etc/udev/rules.d/90-dock.rules from the entry

# ACTION="add", KERNEL=="0-1", SUBSYSTEM=="thunderbolt", ATTR{authorized}=="1", ATTR{boot}=="0", ATTR{device}=="0x1630", ATTR{device_name}=="ThinkPad Thunderbolt 3 Dock", RUN+="/home/user/dotfiles/dock.sh add"
if [[ $(id -u) -ne 0 ]]; then
  echo execute as root! >&2
  exit 1
fi

echo executed >>/tmp/dock.log
date >>/tmp/dock.log

run_cmd() {
  cmd=$1
  runuser -l "$(grep 1000 /etc/passwd | cut -d':' -f1)" -c "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus ${cmd}"
}

ACTION=${1}

case "${ACTION}" in
"add")
  run_cmd "notify-send Dock attached"
  sh ~/dotfiles/screenlayout/default.screenlayout.sh
  ;;
"remove")
  run_cmd "notify-send Dock removed"
  ;;
*)
  run_cmd "notify-send Dock 'called with ${ACTION}'"
  ;;
esac
