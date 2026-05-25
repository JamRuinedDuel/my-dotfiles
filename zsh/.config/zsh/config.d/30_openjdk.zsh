#!/bin/zsh

# -----------------------------------------------------------------------------
# Java OpenJDK
# -----------------------------------------------------------------------------

# install openjdk if not installed yet
if ! (brew list --formula | grep -q "openjdk"); then
  echo "\e[33mopenjdk not found. Installing now...\e[0m"
  brew install openjdk
fi

export PATH="$(brew --prefix openjdk)/bin:$PATH"

