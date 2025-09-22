return {
  "nvim-mini/mini.misc",
  version = false,
  config = function()
    require("mini.misc").setup({
      make_global = { "put", "put_text" },
    })
  end,
}
