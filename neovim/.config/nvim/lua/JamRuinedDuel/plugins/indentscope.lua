local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("nvim-mini/mini.indentscope"),
})

local indentscope = require("mini.indentscope")

indentscope.setup({
  draw = {
    delay = 100,
    animation = indentscope.gen_animation.none(),
  },
  symbol = "│",
})
