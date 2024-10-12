-- This file is used to configure the vim options I prefer

-- Set the leader as a single space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Turn on line numbers
vim.o.number = true

-- Use relative line numbers
vim.o.relativenumber = true

-- Use spaces instead of tabs
vim.o.expandtab = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true

vim.o.termguicolors = true

-- Tell netrw to use a tree view
vim.g.netrw_liststyle = 3

-- Tell vim we're using a nerd font
vim.g.have_nerd_font = 1

-- Tell vim to use the system clipboard
vim.o.clipboard = "unnamedplus"

-- Don't allow using the mouse or trackpad
-- This is mainly meant to prevent me from using the mouse
-- when I probably don't need to
vim.o.mouse = ""

-- Don't show commands in the status line
vim.o.showcmd = false
