#!/bin/zsh

# -----------------------------------------------------------------------------
# EZA: Better LS
# -----------------------------------------------------------------------------

# If Homebrew is not installed, install it.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If eza is not installed, install it.
if ! (brew list --formula | grep -q "eza"); then
  brew install eza
fi

alias ls="eza \
  --color=always \
  --group-directories-first \
  --header \
  --icons=always \
  --modified \
  --no-quotes \
  --git \
"
alias ll="ls -l"
alias lla="ls -la"
alias tree="ls -T"

