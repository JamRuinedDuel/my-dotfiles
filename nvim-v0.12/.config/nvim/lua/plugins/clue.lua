vim.pack.add({
  { src = 'https://github.com/folke/which-key.nvim' },
})

local wk = require('which-key')

wk.setup({
  preset = 'helix',
})

wk.add({
  { '<leader><leader>', group = 'Pickers' },
  { '<leader>w', group = 'Manage windows' },
  { '<leader>b', group = 'Manage buffers' },
  { '<leader>p', group = 'Manage packages' },
})

_G.PluginKeymaps.clue = function()
end
