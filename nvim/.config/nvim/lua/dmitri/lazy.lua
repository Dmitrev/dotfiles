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

require("lazy").setup({
    "folke/neodev.nvim",
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },

    {
        'nvim-treesitter/playground',
        build = ':TSInstall query',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },

     {
         'numToStr/Comment.nvim',
         config = function()
             require('Comment').setup()
         end
     },


    'nvim-tree/nvim-web-devicons',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

-- Show LSP progressbar
    -- TODO: update version when fidget is updated
    {
        'j-hui/fidget.nvim',
        tag = "legacy",
        config = function()
            require('fidget').setup()
        end
    },

    { 'ibhagwan/fzf-lua',
        config = function()
            require('dmitri.plugins.fzf-lua')
        end,
        -- optional for icon support
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },


    -- Automatically set shiftwidth, expand tab and alld that kind of buff options (respects EDITORCONFIG)
    'tpope/vim-sleuth',

    -- Awesome Git plugin
    'tpope/vim-fugitive',

    -- Use DB
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',

    -- Cool file browser
    { 'stevearc/oil.nvim' },

    -- show git diff inside neovim
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    "sindrets/diffview.nvim",

    -- allows to surround text with quotes, tags, brackets etc..
    {
        "kylechui/nvim-surround",
        --tag = "*", -- for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    },

    "onsails/lspkind.nvim",
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     lazy = false,
    -- },
    --
    -- { 'echasnovski/mini.nvim', version = '*' },
    -- Auto complete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    {
        "L3MON4D3/LuaSnip", -- Lua snippets engine
        tag = "v1.2.1",
        dependencies = {
            {'saadparwaiz1/cmp_luasnip'} -- required to autocomplete luasnips!!
        }
    },

    -- html
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                autotag = {
                   enable = true
                }
            })
        end
    },
    {
        'ThePrimeagen/harpoon',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    { "ellisonleao/dotenv.nvim" },
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
        end
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
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "mbbill/undotree"
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
        end
    },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('ayu-mirage')
        end,
    },
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme('gruber-darker')
        end,
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
        },
    },
    -- Using Lazy
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- require('onedark').setup {
            --     style = 'deep'
            -- }
            -- -- Enable theme
            -- require('onedark').load()
        end
    },
    {
        'NickvanDyke/opencode.nvim',
        dependencies = {
            -- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal — otherwise optional
            { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
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
        end
    },
}, opts)
