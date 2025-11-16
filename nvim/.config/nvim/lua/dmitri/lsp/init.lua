local cmp_loaded, cmp = pcall(require, "cmp")
local cmp_nvim_lsp_loaded, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_loaded or not cmp_nvim_lsp_loaded then
    return
end

cmp.setup {
    snippet = {
        expand = function(args) 
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name ='nvim_lsp' },
        { name ='luasnip' }
    }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- set to "debug" if debugging is required otherwise "off"
vim.lsp.log.set_level("off")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', function ()
    vim.diagnostic.jump({count = 1, float = true})
end, opts)
vim.keymap.set('n', ']d', function ()
    vim.diagnostic.jump({count = -1, float = true})
end, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  -- Setup keymaps
  vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
  vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
  vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

  vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, bufopts)
end

local servers = require('dmitri.lsp.servers')
for server, server_config in pairs(servers.getLspConfig()) do
    -- default config
    local lsp_config = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    -- merge in additional config
    for index, value in pairs(server_config) do
        lsp_config[index] = value
    end

    vim.lsp.config[server] = lsp_config
    vim.lsp.enable(server)

end
