local ok, cmp = pcall(require, 'cmp')
if not ok then
    return
end

local augroup = vim.api.nvim_create_augroup("vim-dadbod-completion", {})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sql", "mysql", "plsql"},
    callback = function()
        vim.schedule(function()
            local global_sources = require('dmitri.completion_sources').getSources()
            table.insert(global_sources, {name = 'vim-dadbod-completion'})
            cmp.setup.buffer({
                sources = global_sources
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
