return {
  "AlexvZyl/nordic.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    local nordic = require("nordic")

    nordic.setup({
      bold_keywords = false,
      italic_comments = false,
      transparent = {
        bg = true,
        float = false,
      },
      bright_border = false,
      reduced_blue = false,
      swap_backgrounds = false,
      cursorline = {
        bold = false,
        bold_number = true,
        theme = "dark",
      },
    })

    nordic.load()
  end,
}
