vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#aaaaaa", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "VertSplit", { fg = "#aaaaaa", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "SnackPicker", { bg = "none", nocombine = true })
    -- vim.api.nvim_set_hl(0, "SnackPickerBorder", { fg = "#316c71", bg = "none", nocombine = true })
  end,
})

-- Enable JAVA format-on-save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.java",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
