#!/bin/zsh

# -----------------------------------------------------------------------------
# ZOXIDE: Better CD
# -----------------------------------------------------------------------------

# If Homebrew is not installed, install it.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If zoxide is not installed, install it.
if ! (brew list --formula | grep -q "zoxide"); then
  brew install zoxide
fi

eval "$(zoxide init zsh)"

