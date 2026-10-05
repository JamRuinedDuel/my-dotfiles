-- global keymap registry
_G.PluginKeymaps = {}

-- global helper functions registry
_G.Helpers = {}

-- get highlight group attributes
_G.Helpers.get_hl_hex = function(name)
  local hl = vim.api.nvim_get_hl(0, { name = name,  link = true })
  local colors = {}

  if hl.fg then
    colors.fg = string.format("#%06x", hl.fg)
  else
    colors.fg = 'NONE'
  end

  if hl.bg then
    colors.bg = string.format("#%06x", hl.bg)
  else
    colors.bg = 'NONE'
  end

  return colors
end
