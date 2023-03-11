require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "intelephense", -- PHP, requires license for premium features in ~/intelephense/licence.txt
        "phpactor", -- PHP, requires license for premium features in ~/intelephense/licence.txt
        "html",
        "tsserver", 
        "jsonls",
        "yamlls",
        "volar", -- vuejs
        "lua_ls",
        "rust_analyzer",
        "cssls",
    }
})
