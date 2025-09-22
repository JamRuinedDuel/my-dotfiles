return {
  "nvim-mini/mini.map",
  version = false,
  config = function()
    require("mini.map").setup({
      window = {
        focusable = false,
        side = "left",
        show_integration_count = true,
        width = 15,
        winblend = 25,
        zindex = 10,
      },
    })
  end,
}

