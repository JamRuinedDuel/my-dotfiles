vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.cursorword', version = 'main' },
})

local cursorword = require 'mini.cursorword'

cursorword.setup({
  delay = 100,
})

_G.PluginKeymaps.cursorword = function()
end
