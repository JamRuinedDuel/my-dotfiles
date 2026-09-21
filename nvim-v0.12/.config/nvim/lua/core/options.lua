local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.backspace = 'indent,eol,start'
opt.wrap = false
opt.linebreak = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.number = true
opt.relativenumber = false
opt.signcolumn = 'yes:1'
opt.cursorline = true
opt.colorcolumn = ''
opt.laststatus = 3
opt.showmode = false
opt.showtabline = 0

opt.autocomplete = true
opt.autocompletedelay = 50
opt.clipboard:append('unnamedplus')

opt.splitright = true
opt.splitbelow = true
opt.equalalways = true
