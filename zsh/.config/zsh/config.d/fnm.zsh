#!/bin/zsh

# -----------------------------------------------------------------------------
# FNM: Fast Node Manager
# -----------------------------------------------------------------------------

# If Homebrew is not installed, install it.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If fnm is not installed, install it.
if ! (brew list --formula | grep -q "fnm"); then
  brew install fnm
  fnm install --lts
fi

eval "$(fnm env --use-on-cd --shell zsh)"

