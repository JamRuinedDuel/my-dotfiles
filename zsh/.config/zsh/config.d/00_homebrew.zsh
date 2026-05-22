#!/bin/zsh

# -----------------------------------------------------------------------------
# HOMEBREW: macOS package manager
# -----------------------------------------------------------------------------

# determine Homebrew's expected path based on system architecture
if [[ "$(uname -m)" == "arm64" ]]; then
  local BREW_PATH="/opt/homebrew/bin/brew"
else
  local BREW_PATH="/usr/local/bin/brew"
fi

# check if the brew binary already exists
if [[ ! -f "$BREW_PATH" ]]; then
  echo "\e[33mHomebrew not found. Installing now...\e[0m"

  # run Homebrew installation script
  /bin/bash -c "$(curl -fsSL https://githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # verify installation success
  if [[ -f "$BREW_PATH" ]]; then
    echo "\e[32mHomebrew installed successfully!\e[0m"
  else
    echo "\e[31mHomebrew installation failed.\e[0m"
    return 1
  fi
fi

