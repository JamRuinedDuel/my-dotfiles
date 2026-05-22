#!/bin/zsh

# -----------------------------------------------------------------------------
# AEROSPACE: tiling manager
# -----------------------------------------------------------------------------

# If aerospace is not installed, install it.
if ! (brew list --casks | grep -q "aerospace"); then
  echo "\e[33maerospace not found. Installing now...\e[0m"
  brew install --cask nikitabobko/tap/aerospace
fi

