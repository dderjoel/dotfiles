# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/joel/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# ZMV is a bulk rename tool
autoload zmv

# edit the current command line in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

ZSH_THEME="ys"
CASE_SENSITIVE="true"
# enable command auto-correction.
#ENABLE_CORRECTION="true"

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugins to load
# Standard plugins ~/.oh-my-zsh/plugins/*
# Custom plugins ~/.oh-my-zsh/custom/plugins/
zstyle :omz:plugins:ssh-agent identities id_rsa bitbucket/id_rsa uoa/id_ed25519
plugins=(
  git
  ssh-agent
)


source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source ~/.bash_aliases

#set vi mode for the shell
set -o vi

#set the ^R for recursive search althouth we have the vi-mode in the shell
bindkey '^R' history-incremental-search-backward

if [ -f ~/todo ]
then 
    cat ~/todo
fi

# add bash-insulter
if [ -f /etc/bash.command-not-found ]; then
        . /etc/bash.command-not-found
fi

# keyboard layout: use as a base the intl-edition of us-querty
# map the caps button to the escape key
# map ALT+oua to german umlauts
# direct err to null to get rid of warnings of missing keycodes
xkbcomp -xkb ~/.xkbmap_custom $DISPLAY 2>/dev/null
# set the typematic delay
# xset r rate _delay_ _rate_
test -n $DISPLAY && xset r rate 140 80

