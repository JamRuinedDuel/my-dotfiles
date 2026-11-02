local pack = require("jamruinedduel.utils.pack")
local km = require("jamruinedduel.keymaps.registry")

pack.clean()

km.register("package", function()
  vim.keymap.set("n", "<leader>pc", pack.clean, {
    desc = "Pack: clean packages",
  })

  vim.keymap.set("n", "<leader>pu", pack.update_all, {
    desc = "Pack: update packages",
  })
end)
