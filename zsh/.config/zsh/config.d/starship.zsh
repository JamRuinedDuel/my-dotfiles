#!/bin/zsh

# -----------------------------------------------------------------------------
# Starship Prompt
# -----------------------------------------------------------------------------

# If Homebrew is not installed, install it.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If starship is not installed, install it.
if ! (brew list --formula | grep -q "starship"); then
  brew install starship
fi

eval "$(starship init zsh)"

