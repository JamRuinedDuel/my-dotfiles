local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("hat0uma/csvview.nvim"),
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
