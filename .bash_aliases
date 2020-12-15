alias vi=vim
alias vim=nvim

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias l="ll"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias sn="shutdown now"

#git aliases
alias gs="git status"
alias gd="git diff"
alias gp="git push"

#workld clock function
clc(){
    fmt="+%A, %H:%M"
    echo "UTC       `TZ=UTC/UTC date $fmt`"
    echo "Detroit   `TZ=America/Detroit date $fmt`"
    echo "EST       `TZ=EST date $fmt`"
    echo "Taipei    `TZ=Asia/Taipei date $fmt`"
    echo "Berlin    `TZ=Europe/Berlin date $fmt`"
    echo "Adeleaide `TZ=Australia/Adelaide date $fmt`"
}

# changes directory to the pysical location in case you are in a symlinked dir
alias cdp='cd `pwd -P`' 

#sudo aliases
alias pacman="sudo pacman"
alias docker="sudo docker"
alias mount="sudo mount"
alias umount="sudo umount"

#clone something into ~aur folder
clone(){
    [[ -z ${1} ]] && return 1;
    echo cloning\ ${1}
    cd ~/aur
    git clone "https://aur.archlinux.org/$1"
    cd "$1"
    makepkg -si --noconfirm
}

#display aliases
alias wd="sh ~/dotfiles/screenlayout/default.screenlayout.sh"
alias ws="sh ~/dotfiles/screenlayout/single.screenlayout.sh"
alias wp="sh ~/dotfiles/screenlayout/present.screenlayout.sh"

#hosts
alias vh="sudo vim /etc/hosts"

#default catting out via bat for beautiful syntax-highlighting/pager/linenumber
alias cat="bat"

#fun
alias wtf="man"
alias fucking="sudo "
alias please='sudo $(fc -ln -1) '

# this is for a terminal countdown timer.
alias td="termdown -s "

#alias for daily stand up
alias lunch="termdown -s 12:07 && notify-send 'LUNCH' 'LUNCH' -i face-cool "
alias ad="termdown -s 15:29 && notify-send 'advent' 'advent' -i face-cool "

#alias for starting x
alias x="startx"

# always use monday as first dow
alias cal="cal -m -3"

#npm aliases
alias b='npm run bump'
alias s='npm start'
alias o='npm outdated'
alias u='npm update'
alias uu='ncu -u && npm i && npm update'

