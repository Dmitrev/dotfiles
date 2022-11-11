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
vim.api.nvim_set_keymap("n", "<Leader>ff", ":lua require('telescope.builtin').find_files({hidden=true, winblend=10})<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fa", ":lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lds", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>e", ":lua require('telescope.builtin').oldfiles()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<C-_>", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gr", ":lua require('telescope.builtin').lsp_references()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lic", ":lua require('telescope.builtin').lsp_incoming_calls()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>loc", ":lua require('telescope.builtin').lsp_outgoing_calls()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>lws", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>gi", ":lua require('telescope.builtin').lsp_implementations()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>dl", ":lua require('telescope.builtin').diagnostics()<CR>", { noremap = true})


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
