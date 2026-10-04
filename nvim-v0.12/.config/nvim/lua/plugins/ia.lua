vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.ai', version = 'main' },
})

local ia = require 'mini.ai'

ia.setup({
  custom_textobjects = {},
  mappings = {
    around = 'a',
    inside = 'i',
    around_next = 'an',
    inside_next = 'in',
    around_last = 'al',
    inside_last = 'il',
    goto_left = 'g[',
    goto_right = 'g]',
  },
  n_lines = 50,
  search_method = 'cover_or_next',
  silent = false,
})

_G.PluginKeymaps.ia = function()
end
