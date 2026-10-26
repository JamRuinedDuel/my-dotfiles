#!/bin/zsh

# -----------------------------------------------------------------------------
# BASH
# -----------------------------------------------------------------------------

# install bash if not installed yet
if ! (brew list --formula | grep -q "bash"); then
  echo "\e[33mbash (latest) not found. Installing now...\e[0m"
  brew install bash
fi

export PATH=/opt/homebrew/bin/bash:$PATH

