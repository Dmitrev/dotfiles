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
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
        end
    },

    -- themes
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
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd.colorscheme('tokyonight-night')
        -- end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = function()
            vim.cmd.colorscheme('gruvbox')
        end,
        opts = {}
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd.colorscheme('gruvbox-material')
        -- end
    },
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd.colorscheme('everforest')
        -- end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd.colorscheme('gruvbox-material')
        -- end
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd.colorscheme('kanagawa')
        -- end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {},
        config = function()
            -- vim.cmd.colorscheme('catppuccin')
        end
    },
    -- {
    --     "nyoom-engineering/oxocarbon.nvim",
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         vim.cmd.colorscheme('oxocarbon')
    --     end
    -- },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        -- config = function()
        --     require 'nordic' .load()
        -- end
    },
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        -- config = function()
        --     require('bamboo').setup {
        --         -- optional configuration here
        --     }
        --     require('bamboo').load()
        -- end,
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme('nightlfy')
        -- end
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme('moonfly')
        -- end
    },
    {
        "shaunsingh/moonlight.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
            -- vim.cmd.colorscheme('moonlight')
        -- end
    },
    {
        "Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme('adwaita')
        -- end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme('gruber-darker')
            -- vim.api.nvim_set_hl(0, "@property.php", {fg ="#FFFFFF"})
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

}, opts)
