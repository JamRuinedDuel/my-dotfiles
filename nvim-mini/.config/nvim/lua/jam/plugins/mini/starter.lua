return {
  "nvim-mini/mini.starter",
  version = false,
  config = function()
    require("mini.starter").setup({
      autoopen = true,
      evaluate_single = false,
    })
  end,
}

