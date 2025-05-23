-- map leader key to space 
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Keep the cursor fat in insert mode
vim.opt.guicursor = ""
-- Preview the result of the command as you type (for subtitute mainly)
vim.opt.inccommand="nosplit"
--
-- print line numbers
vim.opt.nu = false
 -- make line numbers relative to where the cursor is
vim.opt.relativenumber = false
-- highlight current line
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

-- Make the colors more vivid https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
-- Enables 24-bit RGB color in the TUI
-- vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- leave 8 lines above and below when scrolling
vim.o.scrolloff = 10
-- vim.o.conceallevel = 1
vim.o.sidescrolloff = 5

vim.opt.hlsearch = false
-- search as you type --
vim.opt.incsearch = true
vim.api.nvim_command('set noshowmode')
vim.opt.wrap = false
vim.opt.splitright = true

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1

-- persist undos when neovim is exited
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/nvim/undo/")

-- auto reload file when updated outside VIM
vim.opt.autoread = true

-- no swapfiles
vim.opt.swapfile = false

-- enables auto save functionality, main reason is that if you do an LSP rename, 
-- you don't have to save all buffers manually
vim.opt.autowrite = true
vim.opt.autowriteall = true

-- This is used for indent-blankline to show end of line char
-- vim.opt.list = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars:append "eol:↴"
vim.lsp.set_log_level('off')
