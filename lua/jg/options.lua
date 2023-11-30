-- [[ Setting options ]]
-- See `:help vim.o`

vim.o.tabstop = 4
vim.o.shiftwidth = 2

vim.opt.termguicolors = true

-- Turn of word wrap
vim.opt.wrap = false

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Enable nocompatible mode
vim.opt.compatible = false

-- Column
vim.opt.colorcolumn = "80"
