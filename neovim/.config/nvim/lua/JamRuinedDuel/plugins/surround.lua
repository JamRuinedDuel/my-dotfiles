local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("nvim-mini/mini.surround"),
})

local surround = require("mini.surround")

surround.setup()
