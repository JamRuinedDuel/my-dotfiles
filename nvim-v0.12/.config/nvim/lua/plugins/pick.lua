vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.pick', version = 'main' },
})

local pick = require 'mini.pick'

pick.setup()

_G.PluginKeymaps.pick = function()
  vim.keymap.set('n', '<leader><leader>', '<cmd>lua MiniPick.builtin.files({ tool = "git" })<cr>', { desc = 'Open file picker' })
end
