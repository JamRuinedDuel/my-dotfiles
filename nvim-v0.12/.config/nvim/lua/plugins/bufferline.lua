vim.pack.add({
  { src = 'https://github.com/willothy/nvim-cokeline' },
})

vim.opt.showtabline = 2

local cokeline = require('cokeline')

local hl_white = _G.Helpers.get_hl_hex('Normal').fg
local hl_black = _G.Helpers.get_hl_hex('Todo').fg
local hl_grey = _G.Helpers.get_hl_hex('Grey').fg
local hl_cyan = _G.Helpers.get_hl_hex('MiniIconsCyan').fg

local set_tabline_highlights = function()
  vim.api.nvim_set_hl(0, 'Tabline', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'TablineFill', { bg = 'NONE' })
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
      return buf.is_focused and hl_black or hl_white
    end,
    bg = function(buf)
      return buf.is_focused and hl_cyan or 'NONE'
    end,
  }, components = {
    {
      text = function(buf)
        return (!buf.is_first and buf.is_focused) and '' or ' '
      end,
      fg = function(buf)
        return buf.is_focused and hl_cyan or 'NONE'
      end,
      bg = 'NONE',
    },
    {
      text = function(buf)
        return ' ' .. buf.devicon.icon
      end,
    },
    {
      text = function(buf)
        return buf.unique_prefix
      end,
    },
    {
      text = function(buf)
        return buf.filename
      end,
    },
    {
      text = function(buf)
        return buf.is_modified and '* ' or ' '
      end,
    },
    {
      text = function(buf)
        return buf.is_focused and '' or ' '
      end,
      fg = function(buf)
        return buf.is_focused and hl_cyan or 'NONE'
      end,
      bg = 'NONE',
    },
    {
      text = function(buf)
        return buf.is_last and '' or ''
      end,
      fg = hl_white,
      bg = 'NONE',
    },
  },
})

_G.PluginKeymaps.bufferline = function()
end
