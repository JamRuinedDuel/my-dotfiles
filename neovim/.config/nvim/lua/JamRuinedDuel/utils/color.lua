_G.Utils.Color = {}

---@param name string
---@return table
_G.Utils.Color.get_hl_hex = function(name)
  local colors = {}
  local hl = vim.api.nvim_get_hl(0, {
    name = name,
    link = true,
  })
  colors.fg = hl.fg and string.format("#%06x", hl.fg) or "NONE"
  colors.bg = hl.bg and string.format("#%06x", hl.bg) or "NONE"
  return colors
end

-- Get palette object of current colorscheme
---@return boolean, ColorPalette
_G.Utils.Color.get_palette = function()
  local palette_require = "JamRuinedDuel.themes." .. vim.g.colors_name .. ".palette"
  return pcall(require, palette_require)
end

-- Get lualine theme based on the current colorscheme
---@return boolean, LualineTheme
_G.Utils.Color.get_lualine_theme = function()
  local theme_require = "JamRuinedDuel.themes." .. vim.g.colors_name .. ".lualine"
  return pcall(require, theme_require)
end
