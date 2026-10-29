vim.pack.add({
  {
    src = "https://github.com/christoomey/vim-tmux-navigator",
    version = "master",
  },
})

vim.g.tmux_navigator_no_mappings = 1

_G.Keymaps.vim_tmux_navigator = function()
  vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, {
    desc = "Tmux navigate left",
    silent = true,
  })
  vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, {
    desc = "Tmux navigate down",
    silent = true,
  })
  vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, {
    desc = "Tmux navigate up",
    silent = true,
  })
  vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, {
    desc = "Tmux navigate right",
    silent = true,
  })
end
