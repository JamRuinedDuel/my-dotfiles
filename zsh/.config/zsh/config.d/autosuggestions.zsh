#!/bin/zsh

# -----------------------------------------------------------------------------
# Z Shell Auto Suggestions
# -----------------------------------------------------------------------------

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# If Homebrew is not installed, install it.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If zsh-autosuggestions is not installed, install it.
if ! (brew list --formula | grep -q "zsh-autosuggestions"); then
  brew install zsh-autosuggestions
fi

# Source zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

