#!/bin/bash

platform=`uname`
if [[ "$platform" == 'Linux' ]]; then
  alias ls="ls --color=auto $*"
elif [[ "$platform" == 'Darwin' ]]; then
  alias ls="ls -G $*"
fi

alias l="ls -1 $*"
alias la="ls -la $*"

# git alias's
alias gs='git status'
alias gp='git pull'

# Shell tools
alias mytop='top -s1 -o cpu -R -F'

# Ruby
alias be="bundle exec $*"

if [[ -f /usr/local/opt/rbenv/bin/rbenv ]]; then
  alias rb="rbenv $*"
fi

alias gist="gist -o $*"
alias hlt="heroku logs -t --app $*"
alias hln="heroku logs -n 300 --app $* | less"
alias hrc="heroku run rails c --app $*"
alias mux="tmuxinator $*"
alias gw="./gradlew $*"
#alias killit=kill $(ps -ef | grep -i $* | awk '{ print $3}')

alias code="cd /c/code"
alias tools="cd /c/tools"

