vim.pack.add({
  {
    src = "https://github.com/nvim-mini/mini.surround",
    version = "main",
  },
})

local surround = require("mini.surround")

surround.setup()

_G.Keymaps.surround = function() end
