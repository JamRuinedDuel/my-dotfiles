return {
  "nvim-mini/mini.animate",
  version = false,
  config = function()
    require("mini.animate").setup({
      cursor = { enable = true },
      scroll = { enable = true },
      resize = { enable = true },
      open = { enable = true },
      close = { enable = true },
    })
  end,
}
