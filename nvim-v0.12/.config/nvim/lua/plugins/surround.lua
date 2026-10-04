vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.surround', version = 'main' },
})

local surround = require 'mini.surround'

surround.setup()

_G.PluginKeymaps.surround = function()
end
