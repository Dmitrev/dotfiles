local M = {}

M.reload = function(module)
    local reload = require("plenary.reload").reload_module
    reload("dmitri", false)

    dofile(vim.env.MYVIMRC)
end

return M
