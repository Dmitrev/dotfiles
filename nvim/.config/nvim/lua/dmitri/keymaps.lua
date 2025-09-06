vim.api.nvim_set_keymap("n", "<leader><leader>r", "<cmd> lua require('dmitri.utils').reload('dmitri')<CR>", { noremap = true })

-- window command
vim.keymap.set({"n"}, "<leader>nn", function()
    if vim.wo.number and vim.wo.relativenumber then
        vim.wo.relativenumber = false
    elseif vim.wo.number and not vim.wo.relativenumber then
        vim.wo.number = false
    else
        vim.wo.number = true
        vim.wo.relativenumber = true
    end
end);

-- save file 
vim.keymap.set({"n"}, "<leader>w", "<cmd>w<CR>", { noremap = false })
vim.keymap.set({"n"}, "<leader>q", "<cmd>q<CR>", { noremap = true })
vim.keymap.set({"n", "v", "i"}, "<c-c>", "<ESC>", { noremap = true })
vim.keymap.set({"t",}, "<ESC>", "<c-\\><c-n>", { noremap = true })

vim.keymap.set({"v"}, "<leader>yc", '"+y', { noremap = true }) -- copy
vim.keymap.set({"n"}, "<leader>yy", '"+yy', { noremap = true }) -- copy
vim.keymap.set({"n"}, "<leader>p", '"+p', { noremap = true }) -- paste
vim.keymap.set({"n"}, "<leader>op", 'o<ESC>"+p', { noremap = true }) -- paste as new line below
vim.keymap.set({"v"}, "<leader>pc", '"_d"+P', { noremap = true }) -- paste
vim.keymap.set({"v"}, "<leader>pr", '"_dP', { noremap = true }) -- paste
vim.keymap.set({"n"}, "<leader>P", '"+P', { noremap = true }) -- paste
vim.keymap.set({"n"}, "<leader>dd", '"_dd', { noremap = true })

-- tabs
vim.keymap.set({"n"}, "<leader>tc", '<cmd>tabnew<CR>', { noremap = true })
vim.keymap.set({"n"}, "<leader>tq", '<cmd>tabclose<CR>', { noremap = true })
vim.keymap.set({"n"}, "<leader>tn", '<cmd>tabnext<CR>', { noremap = true })
vim.keymap.set({"n"}, "<leader>tp", '<cmd>tabprevious<CR>', { noremap = true })
vim.keymap.set({"n"}, "<leader>tj", '<cmd>-tabmove<CR>', { noremap = true })
vim.keymap.set({"n"}, "<leader>tk", '<cmd>tabmove<CR>', { noremap = true })

-- Moving up and down and recenter screen
vim.api.nvim_set_keymap("n", "<c-d>", "<c-d>zz", { noremap = true})
vim.api.nvim_set_keymap("n", "<c-u>", "<c-u>zz", { noremap = true})

-- Move line in visual mode
-- From last cursor position move down one line
-- gv reselects the line
-- = reformats
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "y", "ygv<Esc>", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })

-- LSP keybindings
local ok, fzf = pcall(require, 'fzf-lua')
if ok then
    vim.keymap.set({"n"}, "<Leader><Leader>f", "<cmd>FzfLua resume<CR>", {desc = "resume fzf"})
    vim.keymap.set({"n"}, "<Leader>fa", "<cmd>FzfLua<CR>", {desc = "run fzf"})

    -- vim.keymap.set({"n"}, "<Leader>ff", function()
    --     fzf.files({fd_opts = '--type file --hidden --follow --no-ignore --exclude vendor --exclude node_modules --exclude docker/data'})
    -- end, {desc = "search files"})
    --
    vim.keymap.set({"n"}, "<Leader>fF", function()
        fzf.files({resume = true, fd_opts = '--type file --hidden --follow --no-ignore --exclude vendor --exclude node_modules'})
    end, {desc = "search files include all hidden files"})

    vim.keymap.set({"n"}, "<Leader>bb", function()
        fzf.buffers({})
    end, {desc = "search buffers"})

    vim.keymap.set({"n"}, "<Leader>fg", "<cmd>FzfLua live_grep_glob<CR>", {desc = "search pattern files"})
    vim.keymap.set({"n"}, "<Leader>fg", "<cmd>FzfLua live_grep_glob<CR>", {desc = "search pattern files"})
    vim.keymap.set({"n"}, "<Leader>fh", function()  fzf.help_tags({}) end, {desc = "search help"})

    vim.keymap.set({"n"}, "<Leader>ff", "<cmd>FzfLua files<CR>", {desc = "search files"})
    vim.keymap.set({"n"}, "<Leader>e", "<cmd>FzfLua oldfiles<CR>", {desc = "old files"})
    vim.keymap.set({"n"}, "<C-_>", "<cmd>FzfLua grep_curbuf<CR>", {desc = "buffer lines"})

    vim.api.nvim_set_keymap("n", "<Leader>lds", "<cmd>FzfLua lsp_document_symbols<CR>", { noremap = true, desc = "List document symbols"})
    vim.api.nvim_set_keymap("n", "<Leader>gr", "<cmd>FzfLua lsp_references<CR>", { noremap = true, desc = "LSP References"})
    vim.api.nvim_set_keymap("n", "<Leader>gi", "<cmd>FzfLua lsp_implementations<CR>", { noremap = true, desc = "LSP implementations"})
    vim.api.nvim_set_keymap("n", "<Leader>dl", "<cmd>FzfLua diagnostics_document<CR>", { noremap = true, desc = "List Diagnostics"})
else
    vim.notify("Failed to load fzf-lua skipping setting the keybinds", vim.log.levels.WARN)
end
-- copy file path into clipboard, I used this to run a specific test
vim.keymap.set({"n"}, "<leader>yf", function()
    local utils = require('dmitri.utils')
    vim.fn.setreg("+", utils.get_relative_path())
end)

vim.api.nvim_set_keymap("n", "<leader>yg", "<cmd>lua require('dmitri.utils').copy_github_link()<CR>", { noremap = true, desc = "Get link to github"})
vim.api.nvim_set_keymap("v", "<leader>yg", "<cmd>lua require('dmitri.utils').copy_github_link()<CR>", { noremap = true, desc = "Get link to github"})

-- Quickfix list
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>copen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>cclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cn", "<cmd>cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>cprev<CR>", { noremap = true })


-- Harppon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hh", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>ha", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hs", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hd", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hf", function() ui.nav_file(4) end)
-- DBUI
vim.keymap.set("n", "<leader>dt", "<cmd>DBUIToggle<CR>", { noremap = true, desc = "Toggle DBUI"})
vim.keymap.set("n", "<leader>db", "<cmd>DBUIFindBuffer<CR>", { noremap = true, desc = "Find DBUI buffer"})


-- LSP
vim.keymap.set('n', 'g?', '<cmd>lua vim.diagnostic.open_float()<CR>')


local ok, oil = pcall(require, 'oil')
if ok then
    local cwd = vim.fn.getcwd()

    -- Netrw
    vim.keymap.set("n", "<leader>fb", function() oil.open() end, {desc = "Open file browser in file location"});
    vim.keymap.set("n", "<leader>fB", function() oil.open(cwd) end, {desc = "Open file browser in project root"});
end

-- rest
vim.keymap.set('n', '<leader>re', '<Plug>RestNvim', { desc = 'execute request' })
vim.keymap.set('n', '<leader>rp', '<Plug>RestNvimPreview', { desc = 'preview curl' })
vim.keymap.set('n', '<leader>rl', '<Plug>RestNvimLast', { desc = 'repeat last request' })

local isLspDiagnosticsVisible = false


-- run once to set the default
vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible
})

vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    }) end)

-- TODO: make the , work in keymap
-- vim.keymap.set("i", "<C-,>", function()
--   vim.ui.input({ prompt = "Calculator: " }, function(input)
--     local calc = load("return " .. (input or ""))()
--     if (calc) then
--       vim.api.nvim_feedkeys(tostring(calc), "i", true)
--     end
--   end)
-- end)



-- grug-far
vim.keymap.set("n", "<Leader>ss", "<cmd>GrugFar<cr>");

-- load overrides here
local overrides = require('dmitri.overrides');

if overrides.keymaps ~= nil then
    for k in pairs(overrides.keymaps) do
        local map = overrides.keymaps[k]
        vim.keymap.set(map.mode, map.key, map.map)
    end
end


--debug
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })


-- AI
vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionChat<CR>", { noremap = true, desc = "Open AI chat" })
vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionActions<CR>", { noremap = true, desc = "List all actions" })

vim.keymap.set("n", "<leader>ad", ":CodeCompanion ", { noremap = true, desc = "Start inline chat" })

-- Setup hover.nvim
-- vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
-- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
