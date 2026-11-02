local M = {}

function M.get_hl_hex(hl_name)
  local colors = {}
  local hl = vim.api.nvim_get_hl(0, {
    name = hl_name,
    link = true,
  })
  colors.fg = hl.fg and string.format("#%06x", hl.fg) or "NONE"
  colors.bg = hl.bg and string.format("#%06x", hl.bg) or "NONE"

  return colors
end

function M.get_palette()
  local path = string.format("jamruinedduel.themes.%s.palette", vim.g.colors_name)
  return pcall(require, path)
end

function M.get_lualine_theme()
  local path = string.format("jamruinedduel.themes.%s.lualine", vim.g.colors_name)
  return pcall(require, path)
end

return M
