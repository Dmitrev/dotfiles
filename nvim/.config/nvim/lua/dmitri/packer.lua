-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        requires = {
            'nvim-treesitter/nvim-treesitter'
        }
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = {
            'nvim-treesitter/nvim-treesitter'
        }
    }

    use {
        'nvim-treesitter/playground',
        run = ':TSInstall query',
        requires = {
            'nvim-treesitter/nvim-treesitter'
        }
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup()
        end
    }


    use 'tpope/vim-sleuth'
    use 'tpope/vim-fugitive'
    -- show git diff inside neovim
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    -- allows to surround text with quotes, tags, brackets etc..
    use({
        "kylechui/nvim-surround",
        --tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    })
    use 'onsails/lspkind.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({})
        end
    }
    -- Auto complete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use({
        "L3MON4D3/LuaSnip", -- Lua snippets engine
        tag = "v<CurrentMajor>.*",
        requires = {
            {'saadparwaiz1/cmp_luasnip'} -- required to autocomplete luasnips!!
        }
    })

    -- telescope and extensions
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end
    }

    -- themes --
    use { "themercorp/themer.lua" }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    -- html
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                autotag = {
                    enable = true
                }
            })
        end
    }

    use 'lukas-reineke/indent-blankline.nvim'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
	    require('packer').sync()
    end
end)

