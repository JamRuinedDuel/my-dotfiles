vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.extra', version = 'main' },
})

local extra = require 'mini.extra'

extra.setup()

_G.PluginKeymaps.extra = function()
end
