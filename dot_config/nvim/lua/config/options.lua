-- Neovim options

local opt = vim.opt

-- Leader keys (must be set before lazy.nvim loads plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Indentation (Neovim defaults to 8)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Display
opt.wrap = false
opt.background = "dark"
opt.termguicolors = true

-- Disable netrw (using nvim-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
