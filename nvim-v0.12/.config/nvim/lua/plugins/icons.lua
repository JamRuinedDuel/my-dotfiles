vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.icons', version = 'main' },
})

local icons = require('mini.icons')

icons.setup({
  style = 'glyph',
})

icons.mock_nvim_web_devicons()

_G.PluginKeymaps.icons = function()
end
