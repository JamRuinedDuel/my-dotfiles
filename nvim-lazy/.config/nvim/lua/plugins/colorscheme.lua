return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        float = {
          transparent = false,
          solid = true,
        },
        term_colors = false,
        dim_inactive = {
          enabled = false,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = {},
        },
        lsp_styles = {
          virtual_text = {
            errors = {},
            hints = {},
            warnings = {},
            information = {},
            ok = {},
          },
          underlines = {
            errors = {},
            hints = {},
            warnings = {},
            information = {},
            ok = {},
          },
          inlay_hints = {
            background = true,
          },
        },
        auto_integrations = true,
      })
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
