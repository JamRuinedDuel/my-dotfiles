local keymap = vim.keymap

-- Exit insert mode easily
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- MiniFiles explorer
local toggleMiniFiles = function()
  if not MiniFiles.close() then
    -- open in current buffer's directory
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end
end
keymap.set("n", "<Leader>ee", toggleMiniFiles, { desc = "Open MiniFiles" })

-- Navigate buffers via <S-h> and <S-l>
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Go to next buffer" })

-- Hide search highlighting
keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlighting "})
keymap.set("i", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlighting "})
keymap.set("c", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlighting "})
keymap.set("x", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlighting "})
