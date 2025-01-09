vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Editor options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.list = false
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes:1"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.cursorline = false
vim.opt.scrolloff = 8
vim.opt.autoindent = true

-- Set highlight on search
vim.opt.hlsearch = false
-- Make ine numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse mode
vim.opt.mouse = "a"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 600

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect,noinsert"

vim.opt.colorcolumn = "120"

--set line height to 1.75
--vim.opt.linespace = 6

-- setup the neo-tree plugin to show dotfiles and gitignore files
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1

vim.opt.termguicolors = true
