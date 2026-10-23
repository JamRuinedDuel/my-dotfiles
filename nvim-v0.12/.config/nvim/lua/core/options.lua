-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.backspace = "indent,eol,start"
opt.list = false
opt.listchars = { space = "·" }
opt.wrap = false
opt.linebreak = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.number = true
opt.relativenumber = false
opt.signcolumn = "yes:1"
opt.colorcolumn = ""
opt.laststatus = 3
opt.showmode = false

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true
opt.equalalways = true

opt.undofile = true

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("HelpWrap", { clear = true }),
  pattern = "help",
  callback = function()
    vim.opt_local.wrap = true
  end,
})
