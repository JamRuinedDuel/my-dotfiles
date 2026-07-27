-- colors.lua - Monokai Pro Theme Module for WezTerm
-- Based on loctvl842/monokai-pro.nvim

local wezterm = require("wezterm")
local module = {}

-- Helper function to create a theme variant
local function create_theme(name, palette)
  return {
    -- Cursor colors
    cursor_bg = palette.text,
    cursor_fg = palette.background,
    cursor_border = palette.text,

    -- Selection colors
    selection_fg = palette.background,
    selection_bg = palette.dimmed1,

    -- Terminal colors
    ansi = {
      palette.dark1, -- black
      palette.red, -- red
      palette.green, -- green
      palette.yellow, -- yellow
      palette.blue, -- blue
      palette.magenta, -- magenta
      palette.cyan, -- cyan
      palette.text, -- white
    },
    brights = {
      palette.dimmed3, -- bright black
      palette.brightRed, -- bright red
      palette.brightGreen, -- bright green
      palette.brightYellow, -- bright yellow
      palette.brightBlue, -- bright blue
      palette.brightMagenta, -- bright magenta
      palette.brightCyan, -- bright cyan
      palette.text, -- bright white
    },

    -- Main window colors
    foreground = palette.text,
    background = palette.background,

    -- Tab bar colors
    tab_bar = {
      background = palette.dark1,

      active_tab = {
        bg_color = palette.background,
        fg_color = palette.yellow,
        intensity = "Bold",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = palette.dark1,
        fg_color = palette.dimmed2,
      },

      inactive_tab_hover = {
        bg_color = palette.dimmed5,
        fg_color = palette.dimmed1,
        italic = false,
      },

      new_tab = {
        bg_color = palette.dark1,
        fg_color = palette.dimmed2,
      },

      new_tab_hover = {
        bg_color = palette.dimmed5,
        fg_color = palette.dimmed1,
        italic = false,
      },
    },

    -- Scrollbar
    scrollbar_thumb = palette.dimmed4,

    -- Split colors (for pane splits)
    split = palette.dimmed4,

    -- Visual bell
    visual_bell = palette.dimmed5,

    -- Compose cursor (IME)
    compose_cursor = palette.blue,
  }
end

local colors = {
  black = "#010409",
  white = "#ffffff",
  gray = {
    "#f0f6fc",
    "#c9d1d9",
    "#b1bac4",
    "#8b949e",
    "#6e7681",
    "#484f58",
    "#30363d",
    "#21262d",
    "#161b22",
    "#0d1117",
  },
  blue = {
    "#cae8ff",
    "#a5d6ff",
    "#79c0ff",
    "#58a6ff",
    "#388bfd",
    "#1f6feb",
    "#1158c7",
    "#0d419d",
    "#0c2d6b",
    "#051d4d",
  },
  green = {
    "#aff5b4",
    "#7ee787",
    "#56d364",
    "#3fb950",
    "#2ea043",
    "#238636",
    "#196c2e",
    "#0f5323",
    "#033a16",
    "#04260f",
  },
  yellow = {
    "#f8e3a1",
    "#f2cc60",
    "#e3b341",
    "#d29922",
    "#bb8009",
    "#9e6a03",
    "#845306",
    "#693e00",
    "#4b2900",
    "#341a00",
  },
  orange = {
    "#ffdfb6",
    "#ffc680",
    "#ffa657",
    "#f0883e",
    "#db6d28",
    "#bd561d",
    "#9b4215",
    "#762d0a",
    "#5a1e02",
    "#3d1300",
  },
  red = {
    "#ffdcd7",
    "#ffc1ba",
    "#ffa198",
    "#ff7b72",
    "#f85149",
    "#da3633",
    "#b62324",
    "#8e1519",
    "#67060c",
    "#490202",
  },
  purple = {
    "#eddeff",
    "#e2c5ff",
    "#d2a8ff",
    "#bc8cff",
    "#a371f7",
    "#8957e5",
    "#6e40c9",
    "#553098",
    "#3c1e70",
    "#271052",
  },
  pink = {
    "#ffdaec",
    "#ffbedd",
    "#ff9bce",
    "#f778ba",
    "#db61a2",
    "#bf4b8a",
    "#9e3670",
    "#7d2457",
    "#5e103e",
    "#42062a",
  },
  coral = {
    "#ffddd2",
    "#ffc2b2",
    "#ffa28b",
    "#f78166",
    "#ea6045",
    "#cf462d",
    "#ac3220",
    "#872012",
    "#640d04",
    "#460701",
  },
}

-- Define color palettes for each variant
local palettes = {
  dark_default = {
    dark2 = colors.gray[10],
    dark1 = colors.gray[9],
    background = colors.black,
    text = "#fdfff1",
    red = colors.red[5],
    blue = colors.blue[4],
    yellow = colors.yellow[4],
    green = colors.green[4],
    cyan = "#76e3ea",
    magenta = colors.purple[4],
    brightRed = colors.red[4],
    brightBlue = colors.blue[3],
    brightYellow = colors.yellow[3],
    brightGreen = colors.green[3],
    brightCyan = "#b3f0ff",
    brightMagenta = colors.purple[3],
    dimmed1 = colors.gray[3],
    dimmed2 = colors.gray[4],
    dimmed3 = colors.gray[5],
    dimmed4 = colors.gray[6],
    dimmed5 = colors.gray[7],
  },
}

-- Register all color schemes
function module.register_color_schemes(config)
  if not config.color_schemes then
    config.color_schemes = {}
  end

  for name, palette in pairs(palettes) do
    local scheme_name = "Github (" .. name:gsub("^%l", string.upper) .. ")"
    config.color_schemes[scheme_name] = create_theme(scheme_name, palette)
  end
end

-- Apply the color scheme
function module.apply_to_config(config, variant)
  -- Register all color schemes first
  module.register_color_schemes(config)

  -- Set the default variant (if not specified, use "pro")
  variant = variant or "pro"
  local scheme_name = "Github (" .. variant:gsub("^%l", string.upper) .. ")"

  -- Apply the color scheme
  config.color_scheme = scheme_name

  -- Optional: Add inactive pane dimming for better visibility when using splits
  config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  }
end

-- Export available variants for easy reference
module.variants = {
  "dark_default", -- Github Dark default
}

return module
