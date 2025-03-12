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
   -- PHP
   -- intelephense = {
   --    settings = {
   --      intelephense = {
   --        files = {
   --          maxSize = 3000000;
   --        }
   --      }
   --      -- See https://github.com/bmewburn/intelephense-docs
   --    }
   -- }, -- PHP, requires license for premium features in ~/intelephense/licence.txt
   -- psalm = {},
   phpactor = {
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
   emmet_language_server = {},
   -- END PHP
   html = {
      filetypes = {'html'},
   },
   ts_ls = {},
   jsonls = {},
   yamlls = {
      settings = {
         yaml = {
            keyOrdering = false
         }
      }
   },
   volar = {
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      init_options = {
         vue = {
            hybridMode = false,
         },
      },
   }, -- vuejs
   rust_analyzer = {},
   cssls = {},
   gopls = {},
   pyright = {},
   tailwindcss = {
      filetypes = {'vue'}
   },
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
   clangd = {},
   zls = {},
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
