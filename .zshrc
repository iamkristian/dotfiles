#!/bin/zsh
source ~/.zsh/path
source ~/.zsh/aliases
# source ~/.zsh/theme
# source ~/.zsh/oh-my-zsh
source ~/.zsh/shell
source ~/.zsh/tmuxinator
# source ~/.zsh/wifi
source ~/.zsh/rbenv
source ~/.zsh/nvm
tmux start-server



eval "$(starship init zsh)"

# bun completions
[ -s "/Users/krx/.bun/_bun" ] && source "/Users/krx/.bun/_bun"
