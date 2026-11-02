local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("nvim-mini/mini.cursorword"),
})

local cursorword = require("mini.cursorword")

cursorword.setup({
  delay = 100,
})
