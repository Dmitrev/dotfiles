local ok, treesitter_context = pcall(require, 'treesitter-context')

if not ok then
    print('Treesitter context not installed')
    return
end

treesitter_context.setup({
    max_lines = 1
})
