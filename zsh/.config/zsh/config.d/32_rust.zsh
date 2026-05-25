#!/bin/zsh

# -----------------------------------------------------------------------------
# Rust
# -----------------------------------------------------------------------------

# install rustup if not installed yet
if ! (brew list --formula | grep -q "rustup"); then
  echo "\e[33mrustup not found. Installing now...\e[0m"
  brew install rustup
fi

export PATH=$(brew --prefix rustup)/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
