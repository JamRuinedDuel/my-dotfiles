local pack = require("jamruinedduel.utils.pack")

pack.add({
  pack.gh("rcarriga/nvim-notify"),
})

local notify = require("notify")

notify.setup({
  merge_duplicates = true,
  minimum_width = 40,
  render = "wrapped-compact",
  stages = "fade",
  timeout = 3000,
})

vim.notify = notify
