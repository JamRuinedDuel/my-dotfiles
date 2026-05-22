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

if command -v eza &> /dev/null; then
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
fi
