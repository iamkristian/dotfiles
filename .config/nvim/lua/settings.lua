local o = vim.o
local wo = vim.wo
local bo = vim.bo

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "," -- Same for `maplocalleader`

-- Settings
o.tabstop=2
o.shiftwidth=2
o.expandtab=true
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
o.nobackup=true
o.nowb=true
o.noswapfile=true
o.termguicolors=true
o.undodir="~/.config/nvim/undodir"

bo.expandtab=true
bo.autoindent=true

