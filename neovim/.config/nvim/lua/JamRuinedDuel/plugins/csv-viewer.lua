vim.pack.add({
  {
    src = "https://github.com/hat0uma/csvview.nvim",
    version = "main",
  },
})

local csvview = require("csvview")

csvview.setup({
  view = {
    header_lnum = true,
    sticky_header = {
      enabled = true,
    },
    display_mode = "border",
  },
})

_G.Keymaps.csv_viewer = function() end
