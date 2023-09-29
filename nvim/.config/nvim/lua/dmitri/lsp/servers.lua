local M = {}

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
      language_server_psalm = {
         enabled = true
      },
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
   -- END PHP
   html = {
      filetypes = {'html'},
   },
   tsserver = {},
   jsonls = {},
   yamlls = {
      settings = {
         yaml = {
            keyOrdering = false
         }
      }
   },
   volar = {
      filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
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
