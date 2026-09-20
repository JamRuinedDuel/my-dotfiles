return {
  -- disable default bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  -- use cokeline instead
  {
    "willothy/nvim-cokeline",
    event = "VeryLazy",
    config = function()
      local cokeline = require("cokeline")
      local hlgroups = require("cokeline.hlgroups")

      local function get_color(group, attr)
        return hlgroups.get_hl_attr(group, attr) or "NONE"
      end

      cokeline.setup({
        -- add offset for the file explorer
        sidebar = {
          filetype = { "snacks_layout_box", "neo-tree" },
          components = {
            { text = " ", fg = "NONE", bg = "NONE" },
          },
        },
        components = {
          -- left powerline glyph
          {
            text = function(buf)
              return buf.is_focused and "" or " "
            end,
            fg = function()
              return get_color("OkMsg", "fg")
            end,
            bg = "NONE",
          },
          -- buffer name
          {
            text = function(buf)
              return " " .. buf.filename
            end,
            fg = function(buf)
              return buf.is_focused and get_color("TabLine", "bg") or get_color("Normal", "fg")
            end,
            bg = function(buf)
              return buf.is_focused and get_color("OkMsg", "fg") or "NONE"
            end,
            bold = function(buf)
              return buf.is_focused
            end,
          },
          -- modified indicator
          {
            text = function(buf)
              return buf.is_modified and "* " or " "
            end,
            fg = function(buf)
              return buf.is_focused and get_color("TabLine", "bg") or get_color("Normal", "fg")
            end,
            bg = function(buf)
              return buf.is_focused and get_color("OkMsg", "fg") or "NONE"
            end,
          },
          -- right powerline glyph
          {
            text = function(buf)
              return buf.is_focused and "" or " "
            end,
            fg = function()
              return get_color("OkMsg", "fg")
            end,
            bg = "NONE",
          },
          -- show separator if not the last buffer
          {
            text = function(buf)
              return buf.is_last and " " or ""
            end,
            fg = function()
              return get_color("Normal", "fg")
            end,
            bg = "NONE",
          },
        },
      })
    end,
  },
}
