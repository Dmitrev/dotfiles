local obisidian = vim.api.nvim_create_augroup("Obisidian", {
  clear = true
})


-- Autocommand that sets the conceallevel of a buffer in my obisidian folder.
-- This is needed for the obsidian.nvim plugin so that it can render some fancy UI
vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile"}, { 
  group = obisidian,
  pattern = vim.fn.expand("~") .. "/Sync/obsidian/*/*.md",
  callback = function(ev)
    vim.opt_local.conceallevel = 2
  end

})
