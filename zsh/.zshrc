# use later version of bash from homebrew
export PATH=/opt/homebrew/bin/bash:$PATH
export PATH=$(brew --prefix rustup)/bin:$PATH
export PATH=~/.cargo/bin:$PATH

# -----------------------------------------------------------------------------
# FZF: Fuzzy Finder
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/fzf.zsh

# -----------------------------------------------------------------------------
# Z Shell Auto Suggestions
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/autosuggestions.zsh

# -----------------------------------------------------------------------------
# Z Shell Syntax Highlighting
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/syntax-highlighting.zsh

# -----------------------------------------------------------------------------
# EZA: Better LS
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/eza.zsh

# -----------------------------------------------------------------------------
# ZOXIDE: Better CD
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/zoxide.zsh

# -----------------------------------------------------------------------------
# FNM: Fast Node Manager
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/fnm.zsh

# -----------------------------------------------------------------------------
# Other Aliases
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/aliases.zsh

# -----------------------------------------------------------------------------
# Starship Prompt
# -----------------------------------------------------------------------------
source ~/.config/zsh/config.d/starship.zsh



# Herd injected NVM configuration
export NVM_DIR="/Users/almujeer/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/almujeer/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/almujeer/Library/Application Support/Herd/bin/":$PATH
