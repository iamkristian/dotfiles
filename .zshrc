#!/bin/zsh
source ~/.zsh/path
source ~/.zsh/aliases
source ~/.zsh/theme
source ~/.zsh/oh-my-zsh
source ~/.zsh/shell
source ~/.zsh/tmuxinator
source ~/.zsh/wifi
source ~/.zsh/rbenv
source ~/.zsh/nvm
tmux start-server

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ekkrra/.sdkman"
[[ -s "/Users/ekkrra/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ekkrra/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME=/Users/ekkrra/.sdkman/candidates/java/current/
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# bun completions
[ -s "/Users/kristian/.bun/_bun" ] && source "/Users/kristian/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
