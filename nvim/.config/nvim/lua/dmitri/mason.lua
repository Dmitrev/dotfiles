local s = require("dmitri.lsp.servers")

local mason_loaded, mason = pcall(require, "mason")
local mason_lspconfig_loaded, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_loaded or not mason_lspconfig_loaded then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = s.getMasonConfig(),
    automatic_enable = false
})
