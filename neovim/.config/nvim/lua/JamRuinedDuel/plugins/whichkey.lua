local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("folke/which-key.nvim"),
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
  { "<leader>w",        group = "Manage windows" },
  { "<leader>b",        group = "Manage buffers" },
  { "<leader>p",        group = "Manage packages" },
  { "<leader>l",        group = "Manage LSP packages" },
})
