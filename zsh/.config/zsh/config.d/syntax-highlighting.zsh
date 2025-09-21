#!/bin/zsh

# -----------------------------------------------------------------------------
# Z Shell Syntax Highlighting
# -----------------------------------------------------------------------------

# If Homebrew is not installed, install it.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If zsh-syntax-highlighting is not installed, install it.
if ! (brew list --formula | grep -q "zsh-syntax-highlighting"); then
  brew install zsh-syntax-highlighting
fi

# Source zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

