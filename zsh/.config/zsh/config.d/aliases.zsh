#!/bin/zsh

# -----------------------------------------------------------------------------
# Other Aliases
# -----------------------------------------------------------------------------

if command -v git &> /dev/null; then
  alias g=git
fi

if command -v nvim &> /dev/null; then
  alias vim=nvim
fi

if command -v zoxide &> /dev/null; then
  alias cd=z
fi

