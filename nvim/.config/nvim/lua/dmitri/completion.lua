-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local cmp_loaded, cmp = pcall(require, 'cmp')
local lspkind_loaded, lspkind = pcall(require, 'lspkind')
local luasnip_loaded, luasnip = pcall(require, 'luasnip')

if not cmp_loaded or not lspkind_loaded or not luasnip_loaded then
    return
end

cmp.setup({
    sources = cmp.config.sources(require('dmitri.completion_sources').getSources()),

    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    formatting = {
        format = lspkind.cmp_format({
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                gh_issues = "[issues]",
                tn = "[TabNine]",
                ['vim-dadbod-completion'] = "[DadBod]",
            },
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                return vim_item
            end
        })
    }
})
--
-- cmp.setup.cmdline(':', {
--     sources = {
--         { name = 'cmdline' }
--     }
-- })
--
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

