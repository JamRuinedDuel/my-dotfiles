vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.statusline', version = 'main' },
})

local statusline = require('mini.statusline')

statusline.setup({
  content = {
    active = nil,
    inactive = nil,
  },
  use_icons = true,
})

_G.PluginKeymaps.statusline = function()
end
