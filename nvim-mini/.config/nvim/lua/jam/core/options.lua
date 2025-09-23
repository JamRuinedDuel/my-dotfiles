vim.g.netrw_liststyle = 3
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

--------------------------------------------------------------------------------
-- Editing Behavior
--------------------------------------------------------------------------------
-- number of spaces a <Tab> is worth
opt.tabstop = 2
-- number of spaces used for auto-indent
opt.shiftwidth = 2
-- converts <Tab> to spaces
opt.expandtab = true
-- automatically aligns indentation with current line
opt.autoindent = true
-- automatically indent based on syntax
opt.smartindent = true
-- whether lines wrap or continue off-screen
opt.wrap = true
-- controls the behavior of <BS>, <Del>, <C-W>, <C-U>
opt.backspace = "indent,eol,start"
-- avoids wrapping a line in the middle of a word
opt.linebreak = true

--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------
-- use case-insensitive search
opt.ignorecase = true
-- use case-sensitive search if uppercase is used
opt.smartcase = true
-- highlight search matches
opt.hlsearch = true
-- show matches while typing
opt.incsearch = true

--------------------------------------------------------------------------------
-- User Interface
--------------------------------------------------------------------------------
-- show absolute line numbers
opt.number = true
-- show relative line numbers
opt.relativenumber = false
-- column for diagnostic icons/git signs
opt.signcolumn = "yes:1"
-- highlight current line
opt.cursorline = false
-- vertical line at specific column
opt.colorcolumn = ""
-- Controls when the status line is visible
opt.laststatus = 3
-- for full color scheme fidelity, especially with true color support
opt.termguicolors = true
-- influence how colorschemes render their foreground colors
opt.background = "dark"

--------------------------------------------------------------------------------
-- Performance
--------------------------------------------------------------------------------
-- delay before triggering events
opt.updatetime = 400
-- how long to wait for a mapped sequence
opt.timeoutlen = 1000

--------------------------------------------------------------------------------
-- Clipboard & Mouse
--------------------------------------------------------------------------------
-- share system clipboard
opt.clipboard:append({ "unnamedplus" })
-- enable mouse support
opt.mouse = "a"
-- keep lines visible above/below cursor
opt.scrolloff = 5
-- keep columns visible from left/right of the cursor
opt.sidescrolloff = 10

--------------------------------------------------------------------------------
-- Splits & Windows
--------------------------------------------------------------------------------
-- open vertical splits to the right
opt.splitright = true
-- open horizontal splits below
opt.splitbelow = true
-- auto-resize splits when opening/closing.
opt.equalalways = true

