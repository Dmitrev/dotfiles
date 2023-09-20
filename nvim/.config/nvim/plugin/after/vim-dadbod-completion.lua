local augroup = vim.api.nvim_create_augroup("vim-dadbod-completion", {})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sql", "mysql", "plsql"},
    callback = function()
        vim.schedule(function()
            require('cmp').setup.buffer({
                sources = {
                    {
                        name = 'vim-dadbod-completion'
                    }
                }
            })
        end)
    end
})

-- vim.g.completion_chain_complete_list = {
--     sql = {
--         complete_items = {'vim-dadbod-completion'}
--     }
-- }
--
-- vim.g.completion_matching_strategy_list = {'exact', 'substring'}
