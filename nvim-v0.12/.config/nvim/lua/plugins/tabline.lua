vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.tabline', version = 'main' },
})

vim.opt.showtabline = 2

local tabline = require('mini.tabline')

local hl_cyan = _G.Helpers.get_hl_hex('MiniIconsCyan')
local hl_grey = _G.Helpers.get_hl_hex('Grey')
local hl_todo = _G.Helpers.get_hl_hex('Todo')

local set_tabline_highlights = function()
  vim.api.nvim_set_hl(0, 'MyTablineActive',            { fg = hl_todo.fg, bg = hl_cyan.fg, bold = false })
  vim.api.nvim_set_hl(0, 'MyTablineInactive',          { fg = hl_grey.fg, bg = 'NONE', bold = false })
  vim.api.nvim_set_hl(0, 'Tabline',                    { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'TablineFill',                { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'MiniTablineFill',            { link = 'TabLineFill' })
  vim.api.nvim_set_hl(0, 'MiniTablineCurrent',         { link = 'MyTablineActive' })
  vim.api.nvim_set_hl(0, 'MiniTablineVisible',         { link = 'MyTablineInactive' })
  vim.api.nvim_set_hl(0, 'MiniTablineHidden',          { link = 'MyTablineInactive' })
  vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { link = 'MyTablineActive' })
  vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { link = 'MyTablineInactive' })
  vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden',  { link = 'MyTablineInactive' })
end

set_tabline_highlights()

vim.api.nvim_create_autocmd('Colorscheme', {
  callback = set_tabline_highlights,
})

tabline.setup({
  show_icons = true,
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and '* ' or ''
    return tabline.default_format(buf_id, label) .. suffix
  end,
  tabpage_section = 'left',
})

_G.PluginKeymaps.tabline = function()
end
