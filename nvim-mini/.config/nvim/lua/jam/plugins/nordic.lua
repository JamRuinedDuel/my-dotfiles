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
        bg = true,
        float = true,
      },
      bright_border = true,
      reduced_blue = true,
      swap_backgrounds = true,
      cursorline = {
        bold = false,
        bold_number = true,
        theme = "light",
      },
    })

    nordic.load()
  end,
}
