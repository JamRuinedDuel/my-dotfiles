#!/bin/zsh

# -----------------------------------------------------------------------------
# FZF: Fuzzy Finder
# -----------------------------------------------------------------------------

# If Homebrew is not installed, install it.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If fzf is not installed, install it.
if ! (brew list --formula | grep -q "fzf"); then
  brew install fzf
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

if ! [ -f ~/fzf-git.sh/fzf-git.sh ]; then
  git clone https://github.com/junegunn/fzf-git.sh.git ~
fi

source ~/fzf-git.sh/fzf-git.sh

if command -v bat &> /dev/null; then
  export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
fi

if command -v eza &> /dev/null; then
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
fi

