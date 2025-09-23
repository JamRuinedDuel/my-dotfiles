return {
  "nvim-mini/mini.pick",
  version = false,
  config = function()
    require("mini.pick").setup({
      options = {
        content_from_bottom = true,
        use_cache = true,
      }
    })
  end,
}

