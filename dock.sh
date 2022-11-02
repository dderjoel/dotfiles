#!/usr/bin/env bash

# this script is executed as root from the /etc/udev/rules.d/90-dock.rules from the entry

# ACTION="add", KERNEL=="0-1", SUBSYSTEM=="thunderbolt", ATTR{authorized}=="1", ATTR{boot}=="0", ATTR{device}=="0x1630", ATTR{device_name}=="ThinkPad Thunderbolt 3 Dock", RUN+="/home/user/dotfiles/dock.sh add"
if [[ $(id -u) -ne 0 ]]; then
  echo execute as root! >&2
  exit 1
fi

echo "executed ${1}" >>/tmp/dock.log
date >>/tmp/dock.log
uid=1000
user="$(grep ${uid} /etc/passwd | cut -d':' -f1)"

run_cmd() {
  cmd="XAUTHORITY=/home/${user}/.Xauthority DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${uid}/bus ${1}"
  echo doing "${cmd}" | tee -a /tmp/dock.log
  runuser -l "${user}" -c "${cmd}"
}

ACTION=${1}

case "${ACTION}" in
"add")
  # run_cmd "sh ~/dotfiles/screenlayout/auto.sh"
  run_cmd "sh /home/${user}/dotfiles/screenlayout/default.screenlayout.sh"
  run_cmd "nmcli radio wifi off"
  run_cmd "notify-send Dock attached"
  ;;
"remove")
  run_cmd "sh /home/${user}/dotfiles/screenlayout/single.screenlayout.sh"
  run_cmd "nmcli radio wifi on"
  run_cmd "notify-send Dock removed"
  ;;
*)
  run_cmd "notify-send Dock 'called with ${ACTION}'"
  ;;
esac
