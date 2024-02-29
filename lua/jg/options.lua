-- [[ Setting options ]]
-- See `:help vim.o`

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.opt.termguicolors = true

-- netrw
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw

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

vim.opt.conceallevel = 1

vim.opt.scrolloff = 10
vim.opt.showmatch = true
vim.opt.list = true
vim.opt.listchars = {
	eol = '↵',
	tab = '» ',
}

vim.opt.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
