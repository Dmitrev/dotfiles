local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then

    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set('n', '<leader>hc', function()
  local hl = vim.fn.synIDattr(vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1), 'name')
  print(hl)
end, { desc = "Show highlight group under cursor" })


require("lazy").setup({
    "folke/neodev.nvim",
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        enabled = true,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        enabled = true,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        enabled = true,

    },

    {
        'nvim-treesitter/playground',
        build = ':TSInstall query',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        enabled = true
    },

     {
         'numToStr/Comment.nvim',
         config = function()
             require('Comment').setup()
         end,
        enabled = true
     },


    { 
        'nvim-tree/nvim-web-devicons',
        enabled = true,
    },

-- Show LSP progressbar
    -- TODO: update version when fidget is updated
    {
        'j-hui/fidget.nvim',
        tag = "legacy",
        config = function()
            require('fidget').setup()
        end,
        enabled = true,
    },

    { 'ibhagwan/fzf-lua',
        config = function()
            require('dmitri.plugins.fzf-lua')
        end,
        -- optional for icon support
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        enabled = true,
    },


    -- Automatically set shiftwidth, expand tab and alld that kind of buff options (respects EDITORCONFIG)
    {
        'tpope/vim-sleuth',
        enabled = true,
    },

    -- Awesome Git plugin
    {
        'tpope/vim-fugitive',
        enabled = true,
    },

    -- Use DB
    {
        'tpope/vim-dadbod',
        enabled = true,
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        enabled = true,
    },
    {
        'kristijanhusak/vim-dadbod-completion',
        enabled = true,
    },

    -- Cool file browser
    {
        'stevearc/oil.nvim',
        enabled = true,
    },

    -- show git diff inside neovim
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
        enabled = true,
    },

    {
        "sindrets/diffview.nvim",
        enabled = true,
    },


    -- allows to surround text with quotes, tags, brackets etc..
    {
        "kylechui/nvim-surround",
        --tag = "*", -- for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end,
        enabled = true,
    },

    {
        "onsails/lspkind.nvim",
        enabled = true,
    },
    -- Auto complete
    {
        'hrsh7th/nvim-cmp',
        enabled = true,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        enabled = true,
    },
    {
        'hrsh7th/cmp-buffer',
        enabled = true,
    },
    {
        'hrsh7th/cmp-path',
        enabled = true,
    },
    {
        'hrsh7th/cmp-cmdline',
        enabled = true,
    },

    {
        "L3MON4D3/LuaSnip", -- Lua snippets engine
        tag = "v1.2.1",
        dependencies = {
            {'saadparwaiz1/cmp_luasnip'} -- required to autocomplete luasnips!!
        },

        enabled = true,
    },

    -- html
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                autotag = {
                   enabled = true
                }
            })
        end,
        enabled = true,
    },
    { 
        "ellisonleao/dotenv.nvim",
        enabled = true,
    },
    {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup {
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    -- require('hover.providers.gh')
                    -- require('hover.providers.gh_user')
                    -- require('hover.providers.jira')
                    -- require('hover.providers.man')
                    -- require('hover.providers.dictionary')
                end,
                preview_opts = {
                    border = nil
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true
            }
        end,
        enabled = true,
    },

    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/Sync/obsidian/personal",
                },
            },
            -- see below for full list of options 👇
        },
        enabled = true,
    },
    {
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
        enabled = true,
    },
    {
        "mbbill/undotree",
        enabled = true,
    },
    {
        'MagicDuck/grug-far.nvim',
        -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
        -- additional lazy config to defer loading is not really needed...
        config = function()
            -- optional setup call to override plugin options
            -- alternatively you can set options with vim.g.grug_far = { ... }
            require('grug-far').setup({
                -- options, see Configuration section below
                -- there are no required options atm
                -- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
                -- be specified
            });
        end,
        enabled = true,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.g.gruvbox_material_foreground = "original"
            -- vim.cmd("colorscheme gruvbox-material")
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,

        config = function()
            require("gruber-darker").setup(
                {
                    italic = {
                        strings = false,
                        operators = false,
                    }
                }
            )
            vim.cmd("colorscheme gruber-darker")
        end

    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
        },
        enabled = true,
    },
    -- Using Lazy
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- require('onedark').setup {
            --     style = 'deep'
            -- }
            -- -- enabled theme
            -- require('onedark').load()
        end,
        enabled = true,
    },
    {
        'NickvanDyke/opencode.nvim',
        dependencies = {
            -- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal — otherwise optional
            { 'folke/snacks.nvim', opts = { input = { enabledd = true } } },
        },
        ---@type opencode.Opts
        opts = {
            -- Your configuration, if any — see lua/opencode/config.lua
        },
        keys = {
            -- Recommended keymaps
            { '<leader>oA', function() require('opencode').ask() end, desc = 'Ask opencode', },
            { '<leader>oa', function() require('opencode').ask('@cursor: ') end, desc = 'Ask opencode about this', mode = 'n', },
            { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
            { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle embedded opencode', },
            { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
            { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
            { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
            { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },
            { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select prompt', mode = { 'n', 'v', }, },
            -- Example: keymap for custom prompt
            { '<leader>oe', function() require('opencode').prompt("Explain @cursor and its context") end, desc = "Explain code near cursor", },
        },
        enabled = true,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')

            -- Setup DAP UI
            dapui.setup()

            -- Open DAP UI automatically when debugging starts
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            -- Close DAP UI automatically when debugging ends
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { '/home/dmitri/.local/apps/vscode-php-debug/out/phpDebug.js' }
            }

            dap.configurations.php = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    port = 9000
                }
            }
        end,
        enabled = true,
    },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            -- add options here
            -- or leave it empty to use the default settings
        },
        keys = {
            -- suggested keymap
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
        enabled = true,
    },
}, opts)
