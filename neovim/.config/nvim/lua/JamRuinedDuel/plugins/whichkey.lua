vim.pack.add({
  {
    src = "https://github.com/folke/which-key.nvim",
    version = "main",
  },
})

local wk = require("which-key")

wk.setup({
  preset = "helix",
  win = {
    border = "single",
  },
})

wk.add({
  { "<leader><leader>", group = "Pickers" },
  { "<leader>w", group = "Manage windows" },
  { "<leader>b", group = "Manage buffers" },
  { "<leader>p", group = "Manage packages" },
  { "<leader>l", group = "Manage LSP packages" },
})

_G.Keymaps.whichkey = function() end
