-- Tree sitter query to get the class name and method name inside a routes file

local function get_root(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "php", {})
    local tree = parser:parse()[1]

    return tree:root()
end

vim.api.nvim_create_autocmd({"BufReadPost"}, {
    pattern = {"**/routes/api.php"},
    callback = function(ev)
        local keymaps = vim.api.nvim_buf_get_keymap(0, "n")
        print(vim.inspect(ev))
        -- print(vim.inspect(keymaps))
        -- vim.keymap.set({"n"}, "<Leader>gd", function()
        --     local bufnr = vim.api.nvim_get_current_buf()
        --     print(vim.inspect(get_root(bufnr)))
        -- end)
    end
})


local function get_controller_action(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "php", {})
    -- parse:parse()
    --
    -- local route_query = vim.treesitter.query.parse("php",
    --     [[
    --     (array_creation_expression
    --         (array_element_initializer
    --             (class_constant_access_expression
    --                 (name) @class_name
    --                 (name) @class_keyword
    --             )
    --         )
    --         (array_element_initializer
    --             (string
    --                 (string_value) @method_name
    --             )
    --         )
    --     )
    --     ]]
    -- )
    --
    -- route_query:iter_captures()
end

