#!/bin/zsh

# -----------------------------------------------------------------------------
# RG: ripgrep
# -----------------------------------------------------------------------------

# install ripgrep if not installed yet
if ! (brew list --formula | grep -q "ripgrep"); then
  echo "\e[33mfzf not found. Installing now...\e[0m"
  brew install ripgrep
fi

