local M = {}

M.getSources = function()
    return {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
    }
end

return M
