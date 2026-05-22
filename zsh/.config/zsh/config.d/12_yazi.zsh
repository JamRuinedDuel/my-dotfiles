#!/bin/zsh

# -----------------------------------------------------------------------------
# YAZI: TUI file manager
# -----------------------------------------------------------------------------

# If yazi is not installed, install it with its optional dependencies.
if ! (brew list --formulae | grep -q "yazi"); then
  echo "\e[33myazi not found. Installing now...\e[0m"
  brew install yazi ffmpeg-full sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick-full font-symbols-only-nerd-font
  brew link ffmpeg-full imagemagick-full -f --overwrite
fi

