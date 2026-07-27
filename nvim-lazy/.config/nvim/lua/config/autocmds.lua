-- Enable JAVA format-on-save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.java",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
