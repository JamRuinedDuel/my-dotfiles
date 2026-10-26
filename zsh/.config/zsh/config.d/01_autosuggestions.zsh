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

# If zsh-autosuggestions is not installed, install it.
if ! (brew list --formula | grep -q "zsh-autosuggestions"); then
  echo "\e[33mzsh-autosuggestions not found. Installing now...\e[0m"
  brew install zsh-autosuggestions
fi

# Source zsh-autosuggestions.zsh
local ZSH_AUTO_SUGG_SCRIPT="/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$ZSH_AUTO_SUGG_SCRIPT" ]] && source "$ZSH_AUTO_SUGG_SCRIPT"

