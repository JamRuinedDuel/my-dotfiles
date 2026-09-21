-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- define global keymaps
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlights' })
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Exit insert mode' })
vim.keymap.set('n', 'H', '<cmd>bprev<cr>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', 'L', '<cmd>bnext<cr>', { desc = 'Go to next buffer' })


-- WARN: Do not modify!
-- load all registered plugin keymaps
if _G.PluginKeymaps then
  for plugin_name, register_keymaps in pairs(_G.PluginKeymaps) do
    -- safely execute the keymap function
    local success, err = pcall(register_keymaps)
    if not success then
      vim.notify("Failed to load keymaps for " .. plugin_name .. ": " .. toString(err), vim.log.levels.ERROR)
    end
  end
end

