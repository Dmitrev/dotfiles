local ok, treesitter_context = pcall(require, 'treesitter-context')

if not ok then
    print('Treesitter context not installed')
end

treesitter_context.setup({})
