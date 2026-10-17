vim.pack.add({
  { src = 'https://github.com/willothy/nvim-cokeline' },
})

vim.opt.showtabline = 2

local cokeline = require 'cokeline'
local colors = require 'themes.gruvbox.material.colors'

local set_tabline_highlights = function()
  vim.api.nvim_set_hl(0, 'Tabline', { bg = colors.none })
  vim.api.nvim_set_hl(0, 'TablineFill', { bg = colors.none })
end

set_tabline_highlights()

vim.api.nvim_create_autocmd('Colorscheme', {
  callback = set_tabline_highlights,
})

cokeline.setup({
  show_if_buffers_are_at_least = 1,
  buffers = {
    focus_on_delete = 'prev',
    new_buffers_position = 'last',
    delete_on_right_click = false,
  },
  mappings = {
    disable_mouse = true,
  },
  default_hl = {
    fg = function(buf)
      return buf.is_focused and colors.gray or colors.white
    end,
    bg = function(buf)
      return buf.is_focused and colors.white or colors.none
    end,
  },
  components = {
    {
      text = function(buf) return (!buf.is_first and buf.is_focused) and '' or '' end,
      fg = function(buf) return buf.is_focused and colors.white or colors.none end,
      bg = colors.none,
    },
    { text = function(buf) return ' ' .. buf.devicon.icon end },
    { text = function(buf) return buf.unique_prefix end },
    { text = function(buf) return buf.filename end },
    { text = function(buf) return buf.is_modified and ' [+]' or '' end },
    { text = function(buf) return buf.is_readonly and ' [-]' or '' end },
    { text = ' ' },
    {
      text = function(buf) return buf.is_focused and '' or ' ' end,
      fg = function(buf) return buf.is_focused and colors.white or colors.none end,
      bg = colors.none,
    },
    {
      text = function(buf) return buf.is_last and '' or '' end,
      fg = colors.white,
      bg = colors.none,
    },
  },
})

_G.PluginKeymaps.bufferline = function()
end
