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


#pacman aliases
alias pacman="sudo pacman"


#proxy aliases
alias ep="source ~/enable-proxy.sh"
alias dp="source ~/disable-proxy.sh"

