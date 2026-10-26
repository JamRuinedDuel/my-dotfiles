#!/bin/zsh

# -----------------------------------------------------------------------------
# BAT: Better CAT
# -----------------------------------------------------------------------------

# If bat is not installed, install it.
if ! (brew list --formula | grep -q "bat"); then
  echo "\e[33mbat not found. Installing now...\e[0m"
  brew install bat
fi

