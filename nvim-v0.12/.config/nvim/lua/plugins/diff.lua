vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.diff', version = 'main' },
})

local diff = require 'mini.diff'

diff.setup()

_G.PluginKeymaps.diff = function()
end
