-- Highlight region that is yanked
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local dbui_group = vim.api.nvim_create_augroup('DadBodUI', { clear = true })

-- makes it so that tables don't fold in the DB UI
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- disable folding
    vim.opt_local.foldenable = false
  end,
  pattern = 'dbout',
  group = dbui_group
})

-- don't auto convert tabs to spaces in Makefile in case there is no editorconfig
local make_group = vim.api.nvim_create_augroup('Makefile', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt_local.expandtab = false
  end,
  pattern = 'make',
  group = make_group
})
