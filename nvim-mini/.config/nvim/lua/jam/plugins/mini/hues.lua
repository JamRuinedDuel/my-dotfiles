return {
  "nvim-mini/mini.hues",
  version = false,
  config = function()
    require("mini.hues").setup({
      background = "#19213a",
      foreground = "#c4c6cd",
    })
    -- vim.cmd.colorscheme("miniwinter")
  end,
}

