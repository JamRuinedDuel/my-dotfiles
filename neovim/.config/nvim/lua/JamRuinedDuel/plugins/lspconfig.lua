local pack = require("jamruinedduel.utils.pack")
local km = require("jamruinedduel.keymaps.registry")

pack.add({
  pack.gh("neovim/nvim-lspconfig"),
  pack.gh("mason-org/mason.nvim"),
  pack.gh("mason-org/mason-lspconfig.nvim"),
  pack.gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
  pack.gh("folke/lazydev.nvim"),
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")
local lazydev = require("lazydev")

mason.setup({
  ui = {
    border = "single",
  },
})
mason_lspconfig.setup()
mason_tool_installer.setup({
  ensure_installed = {
    "basics-language-server",
    "bash-language-server",
    "clangd",
    "editorconfig-checker",
    "jdtls",
    "json-lsp",
    "lua-language-server",
    "shfmt",
    "stylua",
    "taplo",
    "typos-lsp",
    "yaml-language-server",
  },
})

lazydev.setup()

vim.lsp.config["bashls"] = {
  filetype = { "sh", "bash", "zsh" },
}

vim.o.updatetime = 250

-- show diagnostic message at hover
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      scope = "line",
      border = "single",
    })
  end,
})

-- format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({
      async = false,
    })
  end,
})

km.register("lspconfig", function()
  vim.keymap.set("n", "<leader>lo", vim.cmd.Mason, {
    desc = "Open Mason",
  })
  vim.keymap.set("n", "<leader>lu", vim.cmd.MasonUpdate, {
    desc = "Update Mason libraries",
  })
  vim.keymap.set("n", "<leader>lc", vim.cmd.MasonToolClean, {
    desc = "Clean Mason Tool",
  })
end)
