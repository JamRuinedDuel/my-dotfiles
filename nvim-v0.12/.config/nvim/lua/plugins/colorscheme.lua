vim.pack.add({
  { src = 'https://github.com/sainnhe/gruvbox-material' },
})

-- UI related configurations
vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Gruvbox Material configurations
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_cursor = 'auto'
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_dim_inactive_windows = 1
vim.g.gruvbox_material_visual = 'blue background'
vim.g.gruvbox_material_menu_selection_background = 'grey'
vim.g.gruvbox_material_sign_column_background = 'grey'
vim.g.gruvbox_material_spell_foreground = 'none'
vim.g.gruvbox_material_ui_contrast = 'low'
vim.g.gruvbox_material_show_eob = 1
vim.g.gruvbox_material_float_style = 'blend'
vim.g.gruvbox_material_diagnostic_text_highlight = 0
vim.g.gruvbox_material_diagnostic_line_highlight = 0
vim.g.gruvbox_material_diagnostic_virtual_text = 'grey'
vim.g.gruvbox_material_inlay_highlight_background = 'dimmed'
vim.g.gruvbox_material_disable_terminal_colors = 0
vim.g.gruvbox_material_statusline_style = 'default'
vim.g.gruvbox_material_better_performance = 0

-- Set colorscheme
vim.cmd.colorscheme('gruvbox-material')

_G.PluginKeymaps.colorscheme = function()
end
