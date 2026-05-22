local ZSH_CONFIG_DIR="$HOME/.config/zsh/config.d"

# Loop through and load each .zsh file
if [ -d "$ZSH_CONFIG_DIR" ]; then
  for config_file in "$ZSH_CONFIG_DIR"/*.zsh(N); do
    source "$config_file"
  done
fi

