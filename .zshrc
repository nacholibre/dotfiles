# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#RPROMPT='%{$fg[green]%}%~%{$reset_color%}'

EDITOR='vim'

plugins=(git)

source $ZSH/oh-my-zsh.sh

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

alias ll='ls -al'

#alias tmux="TERM=screen-256color-bce tmux"
#.sessions
#alias vim='/usr/local/bin/vim'

export TERM=xterm-256color

#git aliases
alias gst='git status'

#export LC_ALL="UTF-8"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
PATH=$PATH:$HOME/.composer/vendor/bin
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="$HOME/.symfony/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Don't auto update packages each time new packages is installed via brew.
HOMEBREW_NO_AUTO_UPDATE=1

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/nacholibre'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

alias pco='ssh -q deploy@pcotool01.prod.ng.pco.dk pco \$@'
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"

# Created by `pipx` on 2024-09-11 10:05:24
export PATH="$PATH:/Users/nacholibre/.local/bin"
source "$HOME/.rye/env"
