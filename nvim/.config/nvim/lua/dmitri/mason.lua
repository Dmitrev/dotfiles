require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "intelephense", -- PHP, requires license for premium features in ~/intelephense/licence.txt
        "html",
        "tsserver", 
        "jsonls",
        "yamlls",
        "volar", -- vuejs
        "sumneko_lua",
        "rust_analyzer",
    }
})
