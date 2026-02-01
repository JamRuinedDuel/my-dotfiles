local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Settings
config.font = wezterm.font({
  -- family = "D2CodingLigature Nerd Font",
  -- family = "EnvyCodeR Nerd Font",
  -- family = "FiraMono Nerd Font",
  -- family = "Hack Nerd Font",
  -- family = "IosevkaTerm Nerd Font",
  -- family = "IosevkaTermSlab Nerd Font",
  family = "JetBrainsMonoNL Nerd Font",
  -- family = "MesloLGSDZ Nerd Font",
  -- family = "Monoid Nerd Font",
  -- family = "ShureTechMono Nerd Font",
  -- family = "Terminess Nerd Font",
  -- family = "ZedMono Nerd Font",
  weight = "Regular",
  italic = false,
})
config.font_size = 15
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.text_background_opacity = 1.0

-- Color & Theme Settings
config.colors = {
  foreground = "#e5e9f0",
  background = "#191d24",
  ansi = {
    "#1e222a", -- black
    "#bf616a", -- maroon
    "#a3be8c", -- green
    "#ebcb8b", -- olive
    "#5e81ac", -- navy
    "#b48ead", -- purple
    "#8fbcbb", -- teal
    "#bbc3d4", -- silver
  },
  brights = {
    "#434c5e", -- grey
    "#c5727a", -- red
    "#b1c89d", -- lime
    "#efd49f", -- yellow
    "#81a1c1", -- blue
    "#be9db8", -- fuchsia
    "#9fc6c5", -- aqua
    "#eceff4", -- white
  },
}
config.colors.selection_fg = config.colors.background
config.colors.selection_bg = config.colors.foreground
config.colors.cursor_bg = config.colors.foreground
config.colors.cursor_fg = config.colors.background

-- Tab Settings
config.enable_tab_bar = false

-- Window Settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.6
config.macos_window_background_blur = 10

-- Startup Settings
config.default_prog = {
  "/bin/zsh",
  "-l",
  "-c",
  "tmux attach || tmux new",
}

return config
