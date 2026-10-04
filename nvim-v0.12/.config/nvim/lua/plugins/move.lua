vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.move', version = 'main' },
})

local move = require 'mini.move'

move.setup()

_G.PluginKeymaps.move = function()
end
