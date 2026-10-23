vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.starter", version = "main" },
})

local starter = require("mini.starter")

starter.setup()

_G.PluginKeymaps.starter = function() end
