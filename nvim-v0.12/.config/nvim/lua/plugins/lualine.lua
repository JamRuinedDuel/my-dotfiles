vim.pack.add({
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

local lualine = require 'lualine'
local custom_gruvbox = require 'lualine.themes.gruvbox'

local set_statusline_highlights = function()
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
end

set_statusline_highlights()

vim.api.nvim_create_autocmd('Colorscheme', {
  callback = set_statusline_highlights,
})

custom_gruvbox.normal.c.bg = 'NONE'
custom_gruvbox.insert.c.bg = 'NONE'
custom_gruvbox.visual.c.bg = 'NONE'
custom_gruvbox.replace.c.bg = 'NONE'
custom_gruvbox.command.c.bg = 'NONE'
custom_gruvbox.inactive.c.bg = 'NONE'

lualine.setup({
  options = {
    icons_enabled = true,
    theme = custom_gruvbox,
    component_separator = { left = '', right = '' },
    section_separator = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' ,}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})

_G.PluginKeymaps.lualine = function()
end
