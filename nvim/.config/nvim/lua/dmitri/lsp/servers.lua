-- For Mason v2,
local M = {}
-- local vue_language_server_path = '/home/dmitri/.nvm/version/v20.18.0/lib/node_modules/@vue/language-server'
--
-- local lspconfig = require('lspconfig')
--
-- lspconfig.ts_ls.setup {
--   init_options = {
--     plugins = {
--       {
--         name = '@vue/typescript-plugin',
--         location = vue_language_server_path,
--         languages = { 'vue' },
--       },
--     },
--   },
--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- }

-- No need to set `hybridMode` to `true` as it's the default value

-- for reference see:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
local lsp_servers = {
   phpactor = {
      cmd = { 'phpactor', 'language-server' },
      filetypes = { 'php' },
      root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
      workspace_required = true,
      language_server_phpstan = {
         enabled = true
      },
      filetypes = {"php", "cucumber"},
      cmd = { os.getenv('HOME') .. '/.local/bin/phpactor', 'language-server' },
      indexer = {
        exclude_pattens = {
            -- Default patterns
            "/vendor/**/Tests/**/*",
            "/vendor/**/tests/**/*",
            "/vendor/composer/**/*",
            -- Rector messes with the PHPUnit Base TestCase
            "/vendor/rector/rector/stubs-rector/PHPUnit/**/*",
         }
      }
   },
   -- ruby_lsp = {},
   -- emmet_language_server = {},
   -- -- END PHP
   -- html = {
   --    filetypes = {'html'},
   -- },
   -- ts_ls = {
   --    init_options = { hostInfo = 'neovim' },
   --    cmd = { 'typescript-language-server', '--stdio' },
   --    filetypes = {
   --       'javascript',
   --       'javascriptreact',
   --       'javascript.jsx',
   --       'typescript',
   --       'typescriptreact',
   --       'typescript.tsx',
   --    },
   --    root_dir = function(bufnr, on_dir)
   --       -- The project root is where the LSP can be started from
   --       -- As stated in the documentation above, this LSP supports monorepos and simple projects.
   --       -- We select then from the project root, which is identified by the presence of a package
   --       -- manager lock file.
   --       local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
   --       -- Give the root markers equal priority by wrapping them in a table
   --       root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers, { '.git' } }
   --       or vim.list_extend(root_markers, { '.git' })
   --       -- exclude deno
   --       local deno_path = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' })
   --       local project_root = vim.fs.root(bufnr, root_markers)
   --       if deno_path and (not project_root or #deno_path >= #project_root) then
   --          return
   --       end
   --       -- We fallback to the current working directory if no project root is found
   --       on_dir(project_root or vim.fn.getcwd())
   --    end,
   --    handlers = {
   --       -- handle rename request for certain code actions like extracting functions / types
   --       ['_typescript.rename'] = function(_, result, ctx)
   --          local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
   --          vim.lsp.util.show_document({
   --             uri = result.textDocument.uri,
   --             range = {
   --                start = result.position,
   --                ['end'] = result.position,
   --             },
   --          }, client.offset_encoding)
   --          vim.lsp.buf.rename()
   --          return vim.NIL
   --       end,
   --    },
   --    commands = {
   --       ['editor.action.showReferences'] = function(command, ctx)
   --          local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
   --          local file_uri, position, references = unpack(command.arguments)
   --
   --          local quickfix_items = vim.lsp.util.locations_to_items(references --[[@as any]], client.offset_encoding)
   --          vim.fn.setqflist({}, ' ', {
   --             title = command.title,
   --             items = quickfix_items,
   --             context = {
   --                command = command,
   --                bufnr = ctx.bufnr,
   --             },
   --          })
   --
   --          vim.lsp.util.show_document({
   --             uri = file_uri --[[@as string]],
   --             range = {
   --                start = position --[[@as lsp.Position]],
   --                ['end'] = position --[[@as lsp.Position]],
   --             },
   --          }, client.offset_encoding)
   --          ---@diagnostic enable: assign-type-mismatch
   --
   --          vim.cmd('botright copen')
   --       end,
   --    },
   --    on_attach = function(client, bufnr)
   --       -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
   --       -- `vim.lsp.buf.code_action()` if specified in `context.only`.
   --       vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptSourceAction', function()
   --          local source_actions = vim.tbl_filter(function(action)
   --             return vim.startswith(action, 'source.')
   --          end, client.server_capabilities.codeActionProvider.codeActionKinds)
   --
   --          vim.lsp.buf.code_action({
   --             context = {
   --                only = source_actions,
   --                diagnostics = {},
   --             },
   --          })
   --       end, {})
   --    end,
   -- },
   jsonls = {},
   -- yamlls = {
   --    settings = {
   --       yaml = {
   --          keyOrdering = false
   --       }
   --    }
   -- },
   -- -- vue_ls = {
   -- -- },
   -- -- rust_analyzer = {},
   -- cssls = {},
   gopls = {},
   -- pyright = {},
   -- tailwindcss = {
   --    filetypes = {'vue'}
   -- },
   lua_ls = {
      settings = {
         Lua = {
            runtime = {
               -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
               version = 'LuaJIT',
            },
            diagnostics = {
               -- Get the language server to recognize the `vim` global
               globals = {'vim'},
            },
            workspace = {
               -- Make the server aware of Neovim runtime files
               library = vim.api.nvim_get_runtime_file("", true),
               checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
               enable = false,
            },
         },
      }
   },
   -- clangd = {},
   -- zls = {},
}

---return the mason config
---@return string[]
M.getMasonConfig = function()
   local mason_config = {}

   for server_name in pairs(lsp_servers) do
      table.insert(mason_config, server_name)
   end

   return mason_config
end

---Return Lsp config
---@return {[string]: {[string]: table}}
M.getLspConfig = function()
   return lsp_servers
end

return M
