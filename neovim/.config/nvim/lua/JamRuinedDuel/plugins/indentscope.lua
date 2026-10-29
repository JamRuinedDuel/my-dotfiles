vim.pack.add({
  {
    src = "https://github.com/nvim-mini/mini.indentscope",
    version = "main",
  },
})

local indentscope = require("mini.indentscope")

indentscope.setup({
  draw = {
    delay = 100,
    animation = indentscope.gen_animation.none(),
  },
  symbol = "│",
})

_G.Keymaps.indentscope = function() end
