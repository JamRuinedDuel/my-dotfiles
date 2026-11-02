local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("nvim-mini/mini.icons"),
})

local icons = require("mini.icons")

icons.setup({
  style = "glyph",
})

icons.mock_nvim_web_devicons()
