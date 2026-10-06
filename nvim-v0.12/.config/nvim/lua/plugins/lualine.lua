vim.pack.add({
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

local lualine = require 'lualine'
local colors = require 'themes.gruvbox.material.colors'
local theme = require 'themes.gruvbox.material.lualine'

local mode_map = {
  n = 'normal',
  i = 'insert',
  v = 'visual',
  V = 'visual',
  ['\22'] = 'visual',
  c = 'command',
  r = 'replace',
}

local get_full_mode = function()
  local current_mode = vim.fn.mode()
  return mode_map[current_mode] or current_mode
end

local set_statusline_highlights = function()
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
end

set_statusline_highlights()

vim.api.nvim_create_autocmd('Colorscheme', {
  callback = set_statusline_highlights,
})

lualine.setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = { statusline = {}, winbar = {} },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        icon_enabled = false,
        fmt = function(str, ctx)
          return str:lower():sub(1,1)
        end,
        padding = 1,
      },
      {
        function() return '' end,
        icon_enabled = false,
        fmt = nil,
        padding = 0,
        color = {
          fg = colors.white,
          bg = colors.none,
        }
      },
    },
    lualine_b = {
      {
        'branch',
        color = {
          fg = colors.black,
          bg = colors.green,
        },
      },
      'diff',
      'diagnostics',
    },
    lualine_c = {
      'filename',
    },
    lualine_x = {
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_y = {
      'progress',
    },
    lualine_z = {
      'location',
    },
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
