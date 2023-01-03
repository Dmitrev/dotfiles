-- Highlight region that is yanked
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Autoload skeleton files
local skeleton_group = vim.api.nvim_create_augroup('Skeleton', { clear = true });

vim.api.nvim_create_autocmd('BufNewFile', {
    callback = function()
      vim.cmd([[ 0r ~/.config/nvim/skeletons/skeleton.php]])
    end,
    group = skeleton_group,
    pattern = '*.php'
})
