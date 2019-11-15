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
alias findn="find -name "

#git aliases
alias gs="git status"
alias gd="git diff"
alias gp="git push"


#sudo  aliases
alias pacman="sudo pacman"
alias docker="sudo docker"
alias mount="sudo mount"
alias umount="sudo umount"

alias qb="qutebrowser &"

#display aliases
alias wd="sh ~/.screenlayout/work.sh"
alias wh="sh ~/.screenlayout/home.sh"

#hosts
alias vh="sudo vim /etc/hosts"

#filemanager
alias fm="vifm"

#use fzf to find a file and then open it in vim
v(){
    f=$(fzf);
    if [ ! -z "$f" ];
        then vim $f;
    fi
}

#default catting out via bat for beutiful syntax-highlighting/pager/linenumber
alias cat="bat"

# this is for a terminal countdown timer.
alias td="termdown"

# always use monday as first dow
alias cal="cal -m"

#npm aliases
alias b='npm run bump'
alias s='npm start'
alias o='npm outdated'
alias u='npm update'
alias uu='ncu -u && npm i && npm update'
