vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.animate', version = 'main' },
})

local animate = require 'mini.animate'

animate.setup({
  cursor = { enable = true },
  scroll = { enable = true },
  resize = { enable = true },
  open = { enable = true },
  close = { enable = true },
})

_G.PluginKeymaps.animate = function()
end
