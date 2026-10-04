vim.pack.add({
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
})

vim.g.tmux_navigator_no_mappings = 1

_G.PluginKeymaps.vim_tmux_navigator = function()
  vim.keymap.set('n', '<C-h>', vim.cmd.TmuxNavigateLeft, { desc = 'Tmux navigate left', silent = true })
  vim.keymap.set('n', '<C-l>', vim.cmd.TmuxNavigateRight, { desc = 'Tmux navigate right', silent = true })
end
