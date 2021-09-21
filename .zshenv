#!/usr/bin/env zsh

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH:$HOME/.local/share/gem/ruby/2.7.0/bin
export ZSH="/home/joel/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# set language environment
export LANG=en_US.UTF-8


export EDITOR='vim'
export BROWSER='/usr/bin/qutebrowser'
export XDG_CONFIG_HOME=~/.config

# sourcing personal keys and secrets
source ~/.config/keys.env

#set vi mode for the shell
set -o vi
