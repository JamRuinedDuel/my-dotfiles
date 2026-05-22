#!/bin/zsh

# -----------------------------------------------------------------------------
# TMUX with TPM
# -----------------------------------------------------------------------------

# If tmux is not installed, install it.
if ! (brew list --formula | grep -q "tmux"); then
  echo "\e[33mtmux not found. Installing now...\e[0m"
  brew install tmux
fi

