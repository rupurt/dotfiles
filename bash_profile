# vim:ft=sh:

[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# bash auto-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# enable colored output from ls, etc
export CLICOLOR=1

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

# CHRUBY
if [ -d "/usr/local/share/chruby" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

# RBENV
elif [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

[ -d ~/bin ] && export PATH=~/bin:"$PATH"

# Git
export PATH="/opt/git/bin:$PATH"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres
export PATH="/usr/local/pgsql/bin:$PATH"

# load dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.bash_profile.local ]] && source ~/.bash_profile.local
