vim.pack.add({
  -- dependencies
  'https://github.com/nvim-tree/nvim-web-devicons',
  -- nvim-cokeline
  'https://github.com/willothy/nvim-cokeline',
})

local get_hex = require('cokeline.hlgroups').get_hl_attr

-- nvim-cokeline
require('cokeline').setup({
  show_if_buffers_are_at_least = 1,
  buffers = {
    filter = function(buf)
      -- filter out neo--tree buffer
      return vim.bo[buf.number].filetype ~= ''
    end,
  },
  mappings = {
    cycle_prev_next = true,
    disable_mouse = false,
  },
  history = {
    enabled = true,
    size = 2,
  },
  rendering = {
    max_buffer_width = 999,
  },
  pick = {
    use_filename = true,
  },
  components = {
    {
      text = function(buf)
        return buf.is_focused and '' or ' '
      end,
      fg = function(buf)
        return buf.is_focused and get_hex('Normal', 'fg') end,
      bg = 'none',
    },
    {
      text = function(buf)
        return ' ' .. buf.filename .. ' '
      end,
      fg = function(buf)
        return buf.is_focused and get_hex('Normal', 'bg') or get_hex('Normal', 'fg')
      end,
      bg = function(buf)
        return buf.is_focused and get_hex('Normal', 'fg') or 'none'
      end,
    },
    {
      text = function(buf)
        return buf.is_focused and '' or ' '
      end,
      fg = function(buf)
        return buf.is_focused and get_hex('Normal', 'fg') or 'none'
      end,
      bg = 'none',
    },
  },
})
