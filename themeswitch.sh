#!/usr/bin/env bash

set -e # die on error

i3themeDir=~/.config/i3
i3themeFilename=theme.config

dircolorDir=~/dotfiles/
dircolorFilename=dircolors

day() {
  #i3
  pushd ${i3themeDir}
  test -e ${i3themeFilename} && rm ${i3themeFilename}
  ln -s theme.light.config ${i3themeFilename}
  popd
  i3-msg reload

  # all x, such as xterm
  xrdb -merge ~/.Xresources.light

  # dircolors in 'ls'
  pushd ${dircolorDir}
  test -e ${dircolorFilename} && rm ${dircolorFilename}
  ln -s dircolors.ansi-light "${dircolorFilename}"
  popd

  # GTK
  gsettings set org.gnome.desktop.interface gtk-theme "Raleigh"
  gsettings set org.gnome.desktop.wm.preferences theme "Raleigh"
}
night() {
  #i3
  pushd ${i3themeDir}
  test -e ${i3themeFilename} && rm ${i3themeFilename}
  ln -s theme.dark.config ${i3themeFilename}
  popd
  i3-msg reload

  # all x, such as xterm
  xrdb -merge ~/.Xresources

  # dircolors in 'ls'
  pushd ${dircolorDir}
  test -e ${dircolorFilename} && rm ${dircolorFilename}
  ln -s dircolors.256dark "${dircolorFilename}"
  popd

  gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
  gsettings set org.gnome.desktop.wm.preferences theme "Nordic"
}
info() {
  echo "use with options 'day' or 'night'" >&2
  echo "eg.: ${0} 'day'" >&2
  exit 1

}

test "${#}" == 0 && info
test "${1}" == 'day' && day
test "${1}" == 'night' && night
