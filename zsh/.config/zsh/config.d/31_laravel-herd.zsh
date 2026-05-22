#!/bin/zsh

# -----------------------------------------------------------------------------
# Laravel Herd configuration
# -----------------------------------------------------------------------------

# Herd injected NVM configuration
export NVM_DIR="/Users/almujeer/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/almujeer/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP binary.
export PATH="/Users/almujeer/Library/Application Support/Herd/bin/":$PATH

