return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

    local colors = require('jam.core.colors')

    -- customize statusline highlight groups
    local function set_statusline_highlights()
      vim.api.nvim_set_hl(0, "StatusLine",    { bg = colors.none })
      vim.api.nvim_set_hl(0, "StatusLineNC",  { bg = colors.none })
      vim.api.nvim_set_hl(0, "TabLine",       { bg = colors.none })
      vim.api.nvim_set_hl(0, "TabLineFill",   { bg = colors.none })
    end
    -- apply changes immediately
    set_statusline_highlights()

    -- reapply on colorscheme change
    vim.api.nvim_create_autocmd("Colorscheme", {
      callback = set_statusline_highlights,
    })

    local lualine = require("lualine")

    local custom_nord = {
      normal = {
        a = { fg = colors.nord0, bg = colors.nord7, gui = "bold" },
        b = { fg = colors.nord4, bg = colors.nord0 },
        c = { fg = colors.nord4, bg = colors.none },
        x = { fg = colors.nord3, bg = colors.none },
      },
      insert = {
        a = { fg = colors.nord0, bg = colors.nord14, gui = "bold" },
      },
      visual = {
        a = { fg = colors.nord0, bg = colors.nord15, gui = "bold" },
      },
      replace = {
        a = { fg = colors.nord0, bg = colors.nord13, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.nord0, bg = colors.nord7, gui = "bold" },
        b = { fg = colors.nord4, bg = colors.nord0 },
        c = { fg = colors.nord3, bg = colors.none },
      },
    }

    lualine.setup({
      options = {
        theme = custom_nord,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          "lsp_status",
          "encoding",
          { "fileformat", icons_enabled = false },
          { "filetype", icons_enabled = false },
        },
        lualine_y = { "searchcount" },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {
          "lsp_status",
          "encoding",
          { "fileformat", icons_enabled = false },
          { "filetype", icons_enabled = false },
        },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          function()
            return vim.api.nvim_get_current_buf()
          end
        },
        lualine_b = {},
        lualine_c = {
          {
            "buffers",
            icons_enabled = false,
            use_mode_colors = false,
            buffers_color = {
              active = "lualine_c_normal",
              inactive = "lualine_c_inactive",
            },
            symbols = {
              modified = " *",
              alternate_file = "",
              directory = "",
            },
            fmt = function(name, context)
              local icon = context.current and " " or " "
              return icon .. name
            end,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
