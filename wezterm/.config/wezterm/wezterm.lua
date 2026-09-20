local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Settings
config.font = wezterm.font({
  family = "Iosevka Term Slab",
  -- family = "DepartureMono Nerd Font",
  -- family = "FiraMono Nerd Font Mono",
  -- family = "Hack Nerd Font",
  -- family = "Iosevka Nerd Font",
  -- family = "IosevkaTerm Nerd Font",
  -- family = "JetBrainsMono Nerd Font Mono",
  weight = "Regular",
  italic = false,
})

config.font_size = 16
config.line_height = 1
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.text_background_opacity = 1.0

-- require("monokai-pro").apply_to_config(config, "spectrum")
-- require("github-dark").apply_to_config(config, "dark_default")
config.color_scheme = "Tokyo Night"

-- Tab Settings
config.enable_tab_bar = false

-- Window Settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 100

-- Startup Settings
config.default_prog = {
  "/bin/zsh",
  "-l",
  "-c",
  "tmux attach || tmux new",
}

return config
