#!/bin/zsh

# -----------------------------------------------------------------------------
# ZOXIDE: Better CD
# -----------------------------------------------------------------------------

# If zoxide is not installed, install it.
if ! (brew list --formula | grep -q "zoxide"); then
  echo "\e[33mzoxide not found. Installing now...\e[0m"
  brew install zoxide
fi

eval "$(zoxide init zsh)"

