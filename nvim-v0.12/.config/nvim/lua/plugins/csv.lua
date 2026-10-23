vim.pack.add({
  { src = "https://github.com/hat0uma/csvview.nvim" },
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

_G.PluginKeymaps.csvview = function() end
