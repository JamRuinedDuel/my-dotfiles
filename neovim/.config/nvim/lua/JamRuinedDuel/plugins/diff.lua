vim.pack.add({
  {
    src = "https://github.com/nvim-mini/mini.diff",
    version = "main",
  },
})

local diff = require("mini.diff")

diff.setup()

local toggle_diff_overlay = function()
  diff.toggle_overlay(0)
end

_G.Keymaps.diff = function()
  vim.keymap.set("n", "<leader>d", toggle_diff_overlay, {
    desc = "Toggle diff",
  })
end
