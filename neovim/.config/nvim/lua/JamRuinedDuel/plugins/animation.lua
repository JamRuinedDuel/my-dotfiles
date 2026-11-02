local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("nvim-mini/mini.animate"),
})

local animate = require("mini.animate")

animate.setup({
  cursor = { enable = false },
  scroll = { enable = true },
  resize = { enable = true },
  open = { enable = true },
  close = { enable = true },
})
