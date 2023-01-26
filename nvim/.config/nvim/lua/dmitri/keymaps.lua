vim.api.nvim_set_keymap("n", "<leader><leader>r", "<cmd> lua require('dmitri.utils').reload('dmitri')<CR>", { noremap = true })

-- save file 
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", { noremap = true })

vim.keymap.set({"v"}, "<leader>yc", '"+y', { noremap = true }) -- copy
vim.keymap.set({"n"}, "<leader>yy", '"+yy', { noremap = true }) -- copy
vim.keymap.set({"n"}, "<leader>p", '"+p', { noremap = true }) -- paste
vim.keymap.set({"v"}, "<leader>pc", '"_d"+P', { noremap = true }) -- paste
vim.keymap.set({"v"}, "<leader>pr", '"_dp', { noremap = true }) -- paste
vim.keymap.set({"n"}, "<leader>P", '"+P', { noremap = true }) -- paste
vim.keymap.set({"n"}, "<leader>dd", '"_dd', { noremap = true })


-- register
-- clipboard
-- clipboard is some register


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
local builtin = "require('telescope.builtin')";
local theme = "require('telescope.themes').get_ivy";

vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd> lua ".. builtin..".find_files(".. theme .."({hidden=true}))<CR>", { noremap = true, desc = "Find files"})
vim.api.nvim_set_keymap("n", "<Leader>fa", "<cmd> lua ".. builtin..".find_files(".. theme .."({hidden=true, no_ignore=true}))<CR>", { noremap = true, desc = "Find all files"})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua ".. builtin..".live_grep(".. theme .."())<CR>", { noremap = true, desc = "Grep files"})
vim.api.nvim_set_keymap("n", "<leader>fG", "<cmd>lua ".. builtin..".live_grep(".. theme .."({no_ignore=true}))<CR>", { noremap = true, desc = "Grep all files"})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua ".. builtin..".buffers(".. theme .."())<CR>", { noremap = true, desc = "File browser in cwd"})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua ".. builtin..".help_tags(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lds", "<cmd> lua ".. builtin..".lsp_document_symbols(".. theme .."())<CR>", { noremap = true, desc = "List document symbols"})
vim.api.nvim_set_keymap("n", "<Leader>lws", "<cmd> lua ".. builtin..".lsp_workspace_symbols(".. theme .."())<CR>", { noremap = true, desc = "List workspace symbols"})
vim.api.nvim_set_keymap("n", "<Leader>ldws", "<cmd> lua ".. builtin..".lsp_dynamic_workspace_symbols(".. theme .."())<CR>", { noremap = true, desc = "List dynamic workspace symbols"})
vim.api.nvim_set_keymap("n", "<Leader>e", "<cmd> lua ".. builtin..".oldfiles(".. theme .."())<CR>", { noremap = true, desc = "Recent files"})
vim.api.nvim_set_keymap("n", "<C-_>", "<cmd> lua ".. builtin..".current_buffer_fuzzy_find(".. theme .."())<CR>", { noremap = true, desc = "Fuzzy find buffer"})
vim.api.nvim_set_keymap("n", "<Leader>gr", "<cmd> lua ".. builtin..".lsp_references(".. theme .."())<CR>", { noremap = true, desc = "LSP References"})
vim.api.nvim_set_keymap("n", "<Leader>lic", "<cmd> lua ".. builtin..".lsp_incoming_calls(".. theme .."())<CR>", { noremap = true, desc = "LSP incoming calls"})
vim.api.nvim_set_keymap("n", "<Leader>loc", "<cmd> lua ".. builtin..".lsp_outgoing_calls(".. theme .."())<CR>", { noremap = true, desc = "LSP outgoing calls"})
vim.api.nvim_set_keymap("n", "<Leader>gi", "<cmd> lua ".. builtin..".lsp_implementations(".. theme .."())<CR>", { noremap = true, desc = "LSP implementations"})
vim.api.nvim_set_keymap("n", "<Leader>dl", "<cmd> lua ".. builtin..".diagnostics(".. theme .."())<CR>", { noremap = true, desc = "List Diagnostics"})


-- copy file path into clipboard, I used this to run a specific test
vim.api.nvim_set_keymap("n", "<leader>yf", ":let @+=expand(\"%\")<CR>", { noremap = true, desc = "Copy relative path to system clipboard"})

-- open file browser in current dir
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser hidden=true path=%:p:h<CR>", { noremap = true, desc = "File browser cwd" })
-- open file browser from root dir
vim.api.nvim_set_keymap("n", "<leader>fB", ":Telescope file_browser hidden=true<CR>", { noremap = true, desc = "File browser root" })


-- Quickfix list
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>copen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>cclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cn", "<cmd>cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>cprev<CR>", { noremap = true })


-- NEOGit
-- open file browser in current dir
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser hidden=true path=%:p:h<CR>", { noremap = true, desc = "File browser cwd" })
-- open file browser from root dir
vim.api.nvim_set_keymap("n", "<leader>fB", ":Telescope file_browser hidden=true<CR>", { noremap = true, desc = "File browser root" })


-- Harppon
vim.api.nvim_set_keymap("n", "<leader>hh", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, desc = "Open Harpoon UI" })
vim.api.nvim_set_keymap("n", "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<CR>', { noremap = true, desc = "Add file tot Harpoon" })

vim.api.nvim_set_keymap("n", "<c-t>1", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, desc = "Go to file 1 Harpoon" })
vim.api.nvim_set_keymap("n", "<c-t>2", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, desc = "Go to file 2 Harpoon" })
vim.api.nvim_set_keymap("n", "<c-t>3", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, desc = "Go to file 3 Harpoon" })
vim.api.nvim_set_keymap("n", "<c-t>4", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, desc = "Go to file 4 Harpoon" })
vim.api.nvim_set_keymap("n", "<c-t>5", '<cmd>lua require("harpoon.ui").nav_file(5)<CR>', { noremap = true, desc = "Go to file 5 Harpoon" })
