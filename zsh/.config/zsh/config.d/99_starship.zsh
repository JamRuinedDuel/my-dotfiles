#!/bin/zsh

# -----------------------------------------------------------------------------
# Starship Prompt
# -----------------------------------------------------------------------------

# If starship is not installed, install it.
if ! (brew list --formula | grep -q "starship"); then
  echo "\e[33mstarship not found. Installing now...\e[0m"
  brew install starship
fi

eval "$(starship init zsh)"

