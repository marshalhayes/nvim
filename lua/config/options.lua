-- Set the map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use undo files
vim.opt.undofile = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set the number of spaces to use for each tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Show line numbers
vim.opt.number = true

-- Enable mouse
vim.opt.mouse = "a"

-- Case-insensitive search unless a capital letter is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep the sign column
vim.opt.signcolumn = "yes"

-- Show which line the cursor is on
vim.opt.cursorline = true

-- Clear search highlights after hitting escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Set the fold mode
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Don't fold on startup
vim.opt.foldenable = false
