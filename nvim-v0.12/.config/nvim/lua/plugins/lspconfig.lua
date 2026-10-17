vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/folke/lazydev.nvim' },
})

local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
local mason_tool_installer = require 'mason-tool-installer'
local lazydev = require 'lazydev'

mason.setup({
  ui = {
    border = 'single',
  }
})
mason_lspconfig.setup()
mason_tool_installer.setup({
  ensure_installed = {
    'lua_ls',
    'stylua',
  }
})

lazydev.setup()

_G.PluginKeymaps.lspconfig = function()
  vim.keymap.set('n', '<leader>lo', '<cmd>Mason<cr>', {
    desc = 'Open Mason'
  })
  vim.keymap.set('n', '<leader>lu', '<cmd>MasonUpdate<cr>', {
    desc = 'Update Mason libraries'
  })
end
