-- define global keymaps
vim.keymap.set("n", "<esc>", vim.cmd.nohlsearch, { desc = "Clear search highlights" })
vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- Split movements
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right split" })

local km = require("jamruinedduel.keymaps.registry")
local all_keymaps = km.all()

for plugin_name, fn in pairs(all_keymaps) do
  local ok, err = pcall(fn)
  if not ok then
    vim.notify(
      string.format("Failed to load keymaps for %s: %s", plugin_name, tostring(err)),
      vim.log.levels.ERROR,
      { title = "Keymaps" }
    )
  end
end

-- (optional) clear the registry so a later `:source` won't double-register
km.clear()
