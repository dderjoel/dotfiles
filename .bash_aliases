#!/usr/bin/env bash

alias vi=vim
alias vim=nvim

alias grep='grep --color=auto'

alias ls='ls --hyperlink=auto --color=auto'
alias ll='ls -alF'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias sn="shutdown now"
alias ssn="systemctl suspend"

# git aliases
alias gs="git status"
alias gd="git diff"
alias gp="git push"

#world clock function
clc() {
  fmt="+%A %dth , %H:%M"
  echo "UTC       $(TZ=UTC/UTC date "${fmt}")"
  echo "EST       $(TZ=EST date "${fmt}")"
  echo "Taipei    $(TZ=Asia/Taipei date "${fmt}")"
  echo -e "\e[0;32mBerlin \e[0m   $(TZ=Europe/Berlin date "${fmt}")"
  echo "Adelaide  $(TZ=Australia/Adelaide date "${fmt}")"
  echo "MIT       $(TZ=US/Eastern date "${fmt}")"
}

# changes directory to the pysical location in case you are in a symlinked dir
alias cdp='cd `pwd -P`'
# copies current wd into xclip
alias cdx='pwd | xclip'
# goes into dir from xclip
alias cdpp='cd `xclip -o`'

#sudo aliases
alias pacman='sudo pacman'
alias mount="sudo mount"
alias umount="sudo umount"

#clone something into ~aur folder
clone() {
  [[ -z ${1} ]] && exit 1
  echo cloning\ "${1}"
  pushd ~/aur || exit 1
  git clone "https://aur.archlinux.org/${1}"
  cd "${1}" || exit 1
  makepkg -si --noconfirm
  popd || exit 1
}

#foreach helper
ea() {
  [[ ${#} -eq 0 ]] && echo -e "call like this: ls | ea wc -l\n then wc will be called like 'wc -l file1', then 'wc -l file2' "
  while IFS= read -r line; do
    "${@}" "${line}"
  done
}

upd() {
  echo -e "\e[1;33mchecking aur\e[0m\n\n"
  cd ~/aur || exit 1
  while read -r folder; do
    pushd "${folder}" >/dev/null || exit 1
    echo -n "${folder}"
    git checkout . >/dev/null 2>&1
    git pull 2>&1 | grep --silent 'up to date'
    if [[ $? -eq 1 ]]; then
      if [[ $(makepkg --syncdeps --install --clean --noconfirm >/dev/null 2>/dev/null) ]]; then
        printf " \e[0;31m update failed \uf00d\e[0m\n"
      else
        printf " \e[0;32m updated \uf00c\e[0m\n"
      fi
    else
      printf " \e[0;32m already up to date \uf00c\e[0m\n"
    fi
    #clean untracked files, i.e. binaries
    git clean -f
    popd >/dev/null || exit 1
  done < <(find . -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | sort)
  echo -e "\e[1;33mUpdating Vim Plugins\e[0m\n\n"
  nvim -c "PlugUpdate10 | quitall"
  nvim -c "CocUpdateSync | quitall"
  echo -e "\e[1;33mChecking general packages\e[0m\n\n"
  sudo pacman -Syu
  echo -e "\e[1;33mUpdating Oh My Zsh \e[0m\n\n"
  omz update
}

#display aliases
alias wd="sh ~/dotfiles/screenlayout/default.screenlayout.sh"
alias ws="sh ~/dotfiles/screenlayout/single.screenlayout.sh"
alias wp="sh ~/dotfiles/screenlayout/present.screenlayout.sh"

#default catting out via bat for beautiful syntax-highlighting/pager/linenumber
alias cat="bat"

#kitty
alias icat="kitten icat"
alias mg="kitty +kitten hyperlinked_grep --smart-case"

#fun
alias wtf="man"
alias please='sudo $(fc -ln -1) '

# this is for a terminal countdown timer.
alias td="termdown -s "

#alias for daily stand up
alias lunch="termdown -s 11:57 && notify-send 'LUNCH' 'LUNCH' -i ~/dotfiles/Pictures/icons/hamburger.png "

#alias for starting x
alias x="cd && startx"
#alias for playing a ansible playbook
alias play="ansible-playbook"

# always use monday as first dow
alias cal="cal -m -3"

alias mupdf=zathura

#npm aliases
alias s='npm start'

alias sm='neomutt phd -s Statusupdate\ \#$(expr $(grep -r Statusupdate ~/.local/share/mail/uoa/Sent\ Items/cur | cut -d"#" -f2 | sort -g -u | tail -n1) + 1)'

alias in="mupdf ~/dev/1research/cryptopt-bb/doc/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf &!; exit 0"
alias in2="mupdf ~/dev/1research/cryptopt-bb/doc/64-ia-32-architectures-software-developer-instruction-set-reference-manual-2021.pdf &!; exit 0"

# connect to bluetooth headset
bt() {
  if echo "show" | bluetoothctl | grep "Powered: no" -q; then
    echo "power on" | bluetoothctl
    sleep 0.5
  fi
  echo "connect ${ENV_PXC550_MAC}" | bluetoothctl
  echo -n "waiting-"
  sleep 2.5

  until pactl list sinks | grep "Name: bluez" -q; do
    printf "\b|"
    sleep 0.25
    printf "\b-"
    sleep 0.25
  done
  printf "\n"
  pactl set-default-sink "$(pactl list sinks | grep "Name: bluez" | awk '{print $2}')"
}

btt() {
  sudo rfkill block bluetooth
  sleep 0.5
  sudo rfkill unblock bluetooth
  # sudo systemctl restart bluetooth
  sleep 2.5
  echo "power on" | bluetoothctl
  sleep 0.2
  echo "connect ${ENV_PXC550_MAC}" | bluetoothctl
  sleep 1.5
  echo "connect ${ENV_PXC550_MAC}" | bluetoothctl
  echo -n "waiting-"
  until pactl list sinks | grep "Name: bluez" -q; do
    printf "\b|"
    sleep 0.25
    printf "\b-"
    sleep 0.25
    echo "connect ${ENV_PXC550_MAC}" | bluetoothctl
  done
  printf "\n"
  # if power on yields 'Error.Busy'
  # sudo rfkill unblock all
  # rfkill block bluetooth
  # rfkill unblock bluetooth
  pactl set-default-sink "$(pactl list sinks | grep "Name: bluez" | awk '{print $2}')"
}

#set git user to uni user
alias gsu='git config user.email \"${ENV_GIT_USER_EMAIL_UNI}\" && git config user.name \"${ENV_GIT_USER_NAME_UNI}\" '
at() {
  t="${1:-bt}"
  make check -C ~/dev/4github/project-assemblyline/repo TESTS="/tmp/${t}.tap"
}
I=" --inspect-brk=12345 "
export I

unvpn() {
  pushd /usr/local/lib/gp-saml-gui || exit 1
  deactivate
}
