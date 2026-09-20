return {
  "AlexvZyl/nordic.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    local nordic = require("nordic")

    nordic.setup({
      bold_keywords = true,
      italic_comments = false,
      transparent = {
        bg = false,
        float = false,
      },
      bright_border = false,
      reduced_blue = true,
      swap_backgrounds = false,
      cursorline = {
        bold = false,
        bold_number = true,
        theme = "light",
      },
    })

    nordic.load()
  end,
}
