vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.cmdline', version = 'main' },
})

local cmdline = require 'mini.cmdline'

cmdline.setup({
  autocomplete = {
    enable = true,
    delay = 0,
    map_arrows = true,
  },
  autocorrect = {
    enable = true,
  },
  autopeek = {
    enable = true,
    n_context = 3,
  },
})

_G.PluginKeymaps.cmdline = function()
end
