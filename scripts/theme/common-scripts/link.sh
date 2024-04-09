#!/usr/bin/env bash

#Call with ./${0} FOLDER FILE light|dark
#eg ../common-scripts/link.sh ~/dotfiles/.config/xsettingsd xsettingsd.conf dark

test "${#}" -ne 3 && exit 1

set -e
test -d "${1}" && pushd "${1}"

source="${2}"

target="${source%.*}.${3}.${source##*.}"

echo test $(pwd) "${target}" "${source}"
test -f "${target}"

test -e "${source}" && rm "${source}"
ln -s "${target}" "${source}"
echo ln -s "${target}" "${source}"
