# vim:ft=sh:

# modify the prompt to contain git branch name if applicable
parse_git_branch () {
  git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
}

BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"

export PS1="$BLACK[\u@$RED\h $GREEN\w$RED_BOLD\$(parse_git_branch)$BLACK] "

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

# RBENV
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

[ -d ~/bin ] && export PATH=~/bin:"$PATH"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:/usr/local/bin:/opt/git/bin:/usr/local/sbin"
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"

# Postgres
export PATH=$PATH:/usr/local/pgsql/bin

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# load dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.bash_profile.local ]] && source ~/.bash_profile.local
