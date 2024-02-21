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

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

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
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup {
            }
        end,
        lazy = false,
    },

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

    -- telescope and extensions
    {
        'nvim-telescope/telescope.nvim',
        -- tag = '0.1.1',
        branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'navarasu/onedark.nvim',
        priority = 1000},

    { 'rktjmp/lush.nvim' },
       {
        'maxmx03/dracula.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        -- config = function ()
        -- local dracula = require 'dracula'
        --     dracula.setup()
        --
        --     vim.cmd.colorscheme 'dracula'
        -- end
       },

    {
        'projekt0n/github-nvim-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        -- config = function()
        --     require('github-theme').setup({
        --         -- ...
        --     })
        --
        --     vim.cmd('colorscheme github_dark_high_contrast')
        -- end,
    },
    { 'dasupradyumna/midnight.nvim',
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme('midnight')
        -- end,
    },
    {
        "zootedb0t/citruszest.nvim",
        -- dir = "~/tmp/citruszest.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme('citruszest')
            -- vim.api.nvim_set_hl(0, "Substitute", { link = "IncSearch" })
        end,
    },
    {
        'marko-cerovac/material.nvim',
        lazy = false,
        priority = 1000,
        -- config = function()
        --     require('material').setup({
        --         disable = {
        --             colored_cursor = true
        --         }
        --     })
        --     vim.cmd.colorscheme('material-darker')
        --     vim.cmd('set guicursor=i:block,a:Cursor/Cursor')
        -- end,
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            -- require("everforest").setup({
            --     background = "hard",
            -- })
            --
            -- vim.cmd.colorscheme('everforest')
        end,
    },
    {
        "Tsuzat/NeoSolarized.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- require('NeoSolarized').setup({
            --     transparent = false,
            -- })
            --
            -- vim.cmd [[ colorscheme NeoSolarized ]]
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme('tokyonight')
        end
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
    {
        'rest-nvim/rest.nvim'
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
}, opts)
