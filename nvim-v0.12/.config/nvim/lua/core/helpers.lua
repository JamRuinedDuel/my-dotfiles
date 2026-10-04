-- global keymap registry
_G.PluginKeymaps = {}

-- global helper functions registry
_G.Helpers = {}

-- get highlight group attributes
_G.Helpers.get_hl_hex = function(name)
  local hl = vim.api.nvim_get_hl(0, { name = name,  link = true })
  return { fg = hl.fg or 'NONE', bg = hl.bg or 'NONE' }
end
