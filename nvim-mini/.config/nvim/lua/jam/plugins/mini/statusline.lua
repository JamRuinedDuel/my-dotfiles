return {
  "nvim-mini/mini.statusline",
  version = false,
  config = function()
    require("mini.statusline").setup({
      content = {
        active = nil,
        inactive = nil,
      },
      use_icons = true,
    })
  end,
}
