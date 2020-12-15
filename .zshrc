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

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joel/.oh-my-zsh"

ZSH_THEME_RANDOM_QUIET="yes"
ZSH_THEME="ys"
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "pygmalion" "ys" "agnoster" )

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

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# set language environment
export LANG=en_US.UTF-8

export EDITOR='vim'
export BROWSER='/usr/bin/firefox-developer-edition'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
