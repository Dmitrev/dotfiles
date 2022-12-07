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
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        'nvim-treesitter/playground',
        run = ':TSInstall query'
    }

    use 'terrortylor/nvim-comment'
    use 'nvim-tree/nvim-web-devicons'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use 'tpope/vim-fugitive'
    use({
        "kylechui/nvim-surround",
        --tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use 'onsails/lspkind.nvim'
    use 'itchyny/lightline.vim'
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
    -- themes --
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "NLKNguyen/papercolor-theme" }
    use { 'morhetz/gruvbox' }
    use { 'rebelot/kanagawa.nvim' }
    use 'navarasu/onedark.nvim'

    -- programming specific --
    use 'nelsyeung/twig.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
	    require('packer').sync()
    end
end)
