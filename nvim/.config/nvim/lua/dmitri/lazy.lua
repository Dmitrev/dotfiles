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

    -- Cool file browser
    { 'stevearc/oil.nvim' },

    -- show git diff inside neovim
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

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
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end
    },
    --
    -- themes --
    "rebelot/kanagawa.nvim",
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'nordic' .load()
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
        "epwalsh/obsidian.nvim",
        lazy = true,
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
        event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/obsidian/Personal/**.md" },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- Optional, for completion.
            "hrsh7th/nvim-cmp",

            -- Optional, for search and quick-switch functionality.
            "nvim-telescope/telescope.nvim",

            -- Optional, an alternative to telescope for search and quick-switch functionality.
            -- "ibhagwan/fzf-lua"

            -- Optional, another alternative to telescope for search and quick-switch functionality.
            -- "junegunn/fzf",
            -- "junegunn/fzf.vim"

            -- Optional, alternative to nvim-treesitter for syntax highlighting.
            -- "godlygeek/tabular",
            -- "preservim/vim-markdown",
        },
        opts = {
            dir = "~/Documents/obsidian/Personal",  -- no need to call 'vim.fn.expand' here

            -- see below for full list of options 👇
        },
        config = function(_, opts)
            require("obsidian").setup(opts)

            -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
            -- see also: 'follow_url_func' config option below.
            vim.keymap.set("n", "gf", function()
                if require("obsidian").util.cursor_on_markdown_link() then
                    return "<cmd>ObsidianFollowLink<CR>"
                else
                    return "gf"
                end
            end, { noremap = false, expr = true })
        end,
    }
}, opts)
