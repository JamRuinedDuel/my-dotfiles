local pack = require("jamruinedduel.utils.pack")
local km = require("jamruinedduel.keymaps.registry")

pack.add({
  pack.gh("nvim-mini/mini.diff"),
})

local diff = require("mini.diff")

diff.setup()

km.register("diff", function()
  vim.keymap.set("n", "<leader>d", function()
    diff.toggle_overlay(0)
  end, {
    desc = "Toggle diff",
  })
end)
