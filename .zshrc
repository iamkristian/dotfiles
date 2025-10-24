# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh
source ~/.zsh/path
source ~/.zsh/aliases
source ~/.zsh/func
# source ~/.zsh/theme
# source ~/.zsh/oh-my-zsh
source ~/.zsh/shell
source ~/.zsh/tmuxinator
# source ~/.zsh/wifi
#source ~/.zsh/rbenv
source ~/.zsh/asdf
source ~/.zsh/nvm
tmux start-server

#eval "$(starship init zsh)"

# bun completions
[ -s "/Users/krx/.bun/_bun" ] && source "/Users/krx/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export DOTNET_ROOT=/opt/homebrew/Cellar/dotnet/8.0.4/libexec/sdk
export DOTNET_TOOLS=$HOME/.dotnet/tools
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_TOOLS


# Load Angular CLI autocompletion.
source <(ng completion script)
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
