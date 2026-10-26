vim.pack.add({
  { src = "https://github.com/sotte/presenting.nvim" },
})

local presentation = require("presenting")

presentation.setup({
  options = {
    width = 80,
  },
})

_G.PluginKeymaps.presentation = function() end
