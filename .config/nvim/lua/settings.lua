local o = vim.o
local wo = vim.wo
local bo = vim.bo

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "," -- Same for `maplocalleader`
vim.api.nvim_set_option("clipboard","unnamed")

-- Settings
o.incsearch = true
o.hlsearch = true
o.number = true
o.tags="tags","./tags"
o.ffs=unix,mac,dos
o.re=2
o.cc=79
o.winwidth=79
o.cursorline=cursorcolumn
o.ruler=true
o.syntax=on
-- No backup or swap
vim.g.nobackup=true
vim.g.nowb=true
vim.g.noswapfile=true

o.termguicolors=true
o.undodir="~/.config/nvim/undodir"

-- Indent
o.autoindent=true
o.smartindent=true
o.expandtab=true
o.tabstop=2
o.shiftwidth=2

-- Shell
o.shell = "/bin/zsh"
