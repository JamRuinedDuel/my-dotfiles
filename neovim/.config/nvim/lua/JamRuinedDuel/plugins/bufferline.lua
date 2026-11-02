local pack = require("jamruinedduel.utils.pack")
local color = require("jamruinedduel.utils.color")
local km = require("jamruinedduel.keymaps.registry")

pack.add({
  pack.gh("willothy/nvim-cokeline"),
})

vim.opt.showtabline = 2

local cokeline = require("cokeline")

---@type boolean,ColorPalette
local _, palette = color.get_palette()

local set_tabline_highlights = function()
  vim.api.nvim_set_hl(0, "Tabline", { bg = palette.none })
  vim.api.nvim_set_hl(0, "TablineFill", { bg = palette.none })
end

set_tabline_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_tabline_highlights,
})

cokeline.setup({
  show_if_buffers_are_at_least = 1,
  buffers = {
    focus_on_delete = "prev",
    new_buffers_position = "number",
    delete_on_right_click = false,
  },
  mappings = {
    disable_mouse = true,
  },
  default_hl = {
    fg = function(buf)
      return buf.is_focused and palette.gray or palette.white
    end,
    bg = function(buf)
      return buf.is_focused and palette.white or palette.none
    end,
  },
  components = {
    {
      text = function(buf)
        return (not buf.is_first) and (buf.is_focused and "" or " ") or ""
      end,
      fg = function(buf)
        return buf.is_focused and palette.white or palette.none
      end,
      bg = palette.none,
    },
    {
      text = function(buf)
        return " " .. buf.devicon.icon
      end,
    },
    {
      text = function(buf)
        return buf.unique_prefix
      end,
    },
    {
      text = function(buf)
        return buf.filename .. " "
      end,
    },
    {
      text = function(buf)
        return buf.is_modified and "[+] " or ""
      end,
    },
    {
      text = function(buf)
        return buf.is_readonly and "[-] " or ""
      end,
    },
    {
      text = function(buf)
        local count = buf.diagnostics
        if buf.is_focused then
          return ""
        else
          return 0 < (count.errors + count.warnings + count.infos + count.hints) and "" or " "
        end
      end,
      fg = function(buf)
        return buf.is_focused and palette.white or palette.gray
      end,
      bg = palette.none,
    },
    {
      text = function(buf)
        local count = buf.diagnostics
        return 0 < (count.errors + count.warnings + count.infos + count.hints) and " " or ""
      end,
      fg = palette.none,
      bg = palette.none,
    },
    {
      text = function(buf)
        local count = buf.diagnostics.errors
        return 0 < count and "󰅚 " .. count .. " " or ""
      end,
      fg = palette.red,
      bg = palette.none,
    },
    {
      text = function(buf)
        local count = buf.diagnostics.warnings
        return 0 < count and "󰀪 " .. count .. " " or ""
      end,
      fg = palette.yellow,
      bg = palette.none,
    },
    {
      text = function(buf)
        local count = buf.diagnostics.infos
        return 0 < count and "󰋽 " .. count .. " " or ""
      end,
      fg = palette.blue,
      bg = palette.none,
    },
    {
      text = function(buf)
        local count = buf.diagnostics.hints
        return 0 < count and "󰌶 " .. count .. " " or ""
      end,
      fg = palette.magenta,
      bg = palette.none,
    },
    {
      text = function(buf)
        return buf.is_last and "" or ""
      end,
      fg = palette.white,
      bg = palette.none,
    },
  },
})

km.register("bufferline", function()
  vim.keymap.set("n", "H", vim.cmd.bprevious, { desc = "Go to previous buffer" })
  vim.keymap.set("n", "<leader>bh", vim.cmd.bprevious, { desc = "Go to previous buffer" })
  vim.keymap.set("n", "L", vim.cmd.bnext, { desc = "Go to next buffer" })
  vim.keymap.set("n", "<leader>bl", vim.cmd.bnext, { desc = "Go to next buffer" })
  vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete, { desc = "Close current buffer" })
end)
