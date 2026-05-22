#!/bin/zsh

# -----------------------------------------------------------------------------
# FZF: Fuzzy Finder
# -----------------------------------------------------------------------------

# install fzf if not installed yet
if ! (brew list --formula | grep -q "fzf"); then
  echo "\e[33mfzf not found. Installing now...\e[0m"
  brew install fzf
fi

# install fzf-git.sh for zsh key bindings
FZF_GIT_DIR="$HOME/.config/fzf-git"
FZF_GIT_SCRIPT="$FZF_GIT_DIR/fzf-git.sh"
if ! [ -f "$FZF_GIT_SCRIPT" ]; then
  echo "\e[33mfzf-git.sh not found. Downloading now...\e[0m"
  mkdir -p "$FZF_GIT_DIR"
  curl -fsSL https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh -o "$FZF_GIT_SCRIPT"
fi

# source fzf-git.sh
[[ -f "$FZF_GIT_SCRIPT" ]] && source "$FZF_GIT_SCRIPT"

# Use fd instead of fzf for faster searching
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --excude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for more details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$' {}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
  esac
}

if command -v bat &> /dev/null; then
  export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
fi

if command -v eza &> /dev/null; then
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
fi

