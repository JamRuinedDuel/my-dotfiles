-- define global keymaps
vim.keymap.set('n', '<esc>', vim.cmd.nohlsearch, { desc = 'Clear search highlights' })
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Exit insert mode' })
-- Buffer movements
vim.keymap.set('n', 'H', vim.cmd.bprevious, { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>bh', vim.cmd.bprevious, { desc = 'Go to previous buffer' })
vim.keymap.set('n', 'L', vim.cmd.bnext, { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>bl', vim.cmd.bnext, { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete, { desc = 'Close current buffer' })
-- Split movements
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Move to bottom split' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Move to top split' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Move to right split' })


-- WARN: Do not modify!
-- load all registered plugin keymaps
if _G.PluginKeymaps then
  for plugin_name, register_keymaps in pairs(_G.PluginKeymaps) do
    -- safely execute the keymap function
    local success, err = pcall(register_keymaps)
    if not success then
      vim.notify("Failed to load keymaps for " .. plugin_name .. ": " .. tostring(err), vim.log.levels.ERROR)
    end
  end
end

