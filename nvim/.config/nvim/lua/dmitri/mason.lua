require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"intelephense", "html", "tsserver", "jsonls", "yamlls"}
})
