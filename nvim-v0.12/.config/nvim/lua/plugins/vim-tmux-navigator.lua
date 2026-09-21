vim.pack.add({
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
})

vim.g.tmux_navigator_no_mappings = 1


-- set vim-tmux-navigator custom keymaps
_G.PluginKeymaps.vim_tmux_navigator = function()
  -- <leader>e
  vim.keymap.set('n', 'C-h', '<cmd>TmuxNavigateLeft<cr>', {
    desc = 'Tmux navigate left',
    silent = true,
  })
  vim.keymap.set('n', 'C-l', '<cmd>TmuxNavigateRight<cr>', {
    desc = 'Tmux navigate right',
    silent = true,
  })
end
