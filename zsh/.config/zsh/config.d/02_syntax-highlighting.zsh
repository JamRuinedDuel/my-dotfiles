#!/bin/zsh

# -----------------------------------------------------------------------------
# Z Shell Syntax Highlighting
# -----------------------------------------------------------------------------

# If zsh-syntax-highlighting is not installed, install it.
if ! (brew list --formula | grep -q "zsh-syntax-highlighting"); then
  echo "\e[33mzsh-syntax-highlighting not found. Installing now...\e[0m"
  brew install zsh-syntax-highlighting
fi

# Source zsh-syntax-highlighting.zsh
ZSH_SYN_HIGH_SCRIPT="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "$ZSH_SYN_HIGH_SCRIPT" ] && source "$ZSH_SYN_HIGH_SCRIPT"


