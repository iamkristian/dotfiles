#!/bin/zsh
source ~/.zsh/path
source ~/.zsh/aliases
# source ~/.zsh/theme
# source ~/.zsh/oh-my-zsh
source ~/.zsh/shell
source ~/.zsh/tmuxinator
# source ~/.zsh/wifi
source ~/.zsh/rbenv
source ~/.zsh/asdf
source ~/.zsh/nvm
tmux start-server



eval "$(starship init zsh)"

# bun completions
[ -s "/Users/krx/.bun/_bun" ] && source "/Users/krx/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export DOTNET_ROOT=/opt/homebrew/Cellar/dotnet/8.0.4/libexec/sdk
export DOTNET_TOOLS=$HOME/.dotnet/tools
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_TOOLS
