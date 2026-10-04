vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.files', version = 'main' },
})

local files = require('mini.files')

files.setup()

local toggle_explorer = function()
  if not files.close() then
    files.open(vim.api.nvim_buf_get_name(0), false)
    files.reveal_cwd()
  end
end

_G.PluginKeymaps.files = function()
  vim.keymap.set('n', '<leader>e', toggle_explorer, { desc = 'Toggle MiniFiles', silent = true })
end
