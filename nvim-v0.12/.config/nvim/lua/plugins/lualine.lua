vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local lualine = require("lualine")
local colors = require("themes.gruvbox.material.colors")
local theme = require("themes.gruvbox.material.lualine")

local set_statusline_highlights = function()
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
end

set_statusline_highlights()

vim.api.nvim_create_autocmd("Colorscheme", {
  callback = set_statusline_highlights,
})

lualine.setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { statusline = {}, winbar = {} },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        icon = "󰚩",
        fmt = function(str)
          return str:lower()
        end,
      },
    },
    lualine_b = {
      {
        function()
          return ""
        end,
        color = { bg = colors.none, fg = colors.white },
        padding = 0,
      },
      {
        "branch",
        icon = "",
        color = { bg = colors.purple },
        separator = { left = "", right = "" },
      },
    },
    lualine_c = {
      {
        function()
          return ""
        end,
        padding = 0,
        separator = "",
      },
      {
        "filename",
        path = 4,
        separator = "",
      },
      {
        "diagnostics",
        sources = {
          "nvim_lsp",
          "nvim_diagnostic",
          "nvim_workspace_diagnostic",
        },
      },
    },
    lualine_x = {
      {
        "filetype",
        colored = false,
        icon_only = false,
        separator = "",
      },
      {
        "encoding",
        separator = "",
      },
      {
        "fileformat",
        separator = "",
        symbols = {
          unix = "unix",
          doc = "doc",
          mac = "mac",
        },
      },
      {
        function()
          return ""
        end,
        color = { bg = colors.none, fg = colors.white },
        padding = 0,
      },
    },
    lualine_y = {
      {
        "location",
        color = { bg = colors.purple },
      },
    },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})

_G.PluginKeymaps.lualine = function() end
