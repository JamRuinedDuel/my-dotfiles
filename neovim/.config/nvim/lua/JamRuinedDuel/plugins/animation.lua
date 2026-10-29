vim.pack.add({
  {
    src = "https://github.com/nvim-mini/mini.animate",
    version = "main",
  },
})

local animate = require("mini.animate")

animate.setup({
  cursor = { enable = false },
  scroll = { enable = true },
  resize = { enable = true },
  open = { enable = true },
  close = { enable = true },
})

_G.Keymaps.animation = function() end
