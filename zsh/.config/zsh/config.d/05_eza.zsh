#!/bin/zsh

# -----------------------------------------------------------------------------
# EZA: Better LS
# -----------------------------------------------------------------------------

# If eza is not installed, install it.
if ! (brew list --formula | grep -q "eza"); then
  echo "\e[33meza not found. Installing now...\e[0m"
  brew install eza
fi

