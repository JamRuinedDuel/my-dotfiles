return {
  "nvim-mini/mini.bufremove",
  version = false,
  config = function()
    require("mini.bufremove").setup({
      silent = false,
    })
  end,
}
