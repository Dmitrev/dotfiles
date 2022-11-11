vim.g.mapleader = " "

-- Keep the cursor fat in insert mode
vim.opt.guicursor = ""
-- Preview the result of the command as you type (for subtitute mainly)
vim.opt.inccommand="nosplit"

vim.opt.nu = true
vim.opt.relativenumber = true

-- Make the colors more vivid https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.hlsearch = false
-- search as you type --
vim.opt.incsearch = true
vim.api.nvim_command('set noshowmode')
vim.opt.wrap = false

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

