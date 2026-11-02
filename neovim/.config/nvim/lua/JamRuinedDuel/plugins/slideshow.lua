local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("sotte/presenting.nvim"),
})

local presentation = require("presenting")

presentation.setup({
  options = {
    width = 80,
  },
})
