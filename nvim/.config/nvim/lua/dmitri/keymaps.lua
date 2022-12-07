-- reload
vim.api.nvim_set_keymap("n", "<leader><leader>r", "<cmd> lua require('dmitri.utils').reload('dmitri')<CR>", { noremap = true })

-- Exit to Normal mode
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
-- save file 
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", { noremap = true })

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

vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd> lua ".. builtin..".find_files(".. theme .."({hidden=true}))<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fa", "<cmd> lua ".. builtin..".find_files(".. theme .."({hidden=true, no_ignore=true}))<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua ".. builtin..".live_grep(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fG", "<cmd>lua ".. builtin..".live_grep(".. theme .."({no_ignore=true}))<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua ".. builtin..".buffers(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua ".. builtin..".help_tags(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lds", "<cmd> lua ".. builtin..".lsp_document_symbols(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lws", "<cmd> lua ".. builtin..".lsp_workspace_symbols(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ldws", "<cmd> lua ".. builtin..".lsp_dynamic_workspace_symbols(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>e", "<cmd> lua ".. builtin..".oldfiles(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<C-_>", "<cmd> lua ".. builtin..".current_buffer_fuzzy_find(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gr", "<cmd> lua ".. builtin..".lsp_references(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lic", "<cmd> lua ".. builtin..".lsp_incoming_calls(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>loc", "<cmd> lua ".. builtin..".lsp_outgoing_calls(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lws", "<cmd> lua ".. builtin..".lsp_workspace_symbols(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gi", "<cmd> lua ".. builtin..".lsp_implementations(".. theme .."())<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>dl", "<cmd> lua ".. builtin..".diagnostics(".. theme .."())<CR>", { noremap = true})


vim.api.nvim_set_keymap("n", "<Leader>y", ":let @+=expand(\"%\")<CR>", { noremap = true })


-- File tree keybindings
vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFocus<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":NvimTreeFindFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":NvimTreeCollapse<CR>", { noremap = true })

-- open file browser in current dir
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser hidden=true path=%:p:h<CR>", { noremap = true })
-- open file browser from root dir
vim.api.nvim_set_keymap("n", "<leader>fB", ":Telescope file_browser hidden=true<CR>", { noremap = true })


-- Quickfix list
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>copen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>cclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cn", "<cmd>cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>cprev<CR>", { noremap = true })
