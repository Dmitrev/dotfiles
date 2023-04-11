local s = require("dmitri.lsp.servers")
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = s.getMasonConfig()
})
