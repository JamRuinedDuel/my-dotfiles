return {
  "nvim-mini/mini.icons",
  version = false,
  config = function()
    require("mini.icons").setup({
      style = 'glyph', -- 'glyph' | 'ascii'
    })
  end,
}
