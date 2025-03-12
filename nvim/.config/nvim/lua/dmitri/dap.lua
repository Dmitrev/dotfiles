local dap = require('dap')

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = {
    os.getenv('HOME') .. "/.local/apps/vscode-php-debug/out/phpDebug.js"
  }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
  }
}

vim.keymap.set({'n'}, '<leader>bt', dap.toggle_breakpoint)
vim.keymap.set({'n'}, '<leader>bi', dap.step_into)
vim.keymap.set({'n'}, '<leader>bo', dap.step_over)
vim.keymap.set({'n'}, '<leader>bl', dap.list_breakpoints)
vim.keymap.set({'n'}, '<leader>bc', dap.clear_breakpoints)
vim.keymap.set({'n'}, '<leader>bu', dap.up)
vim.keymap.set({'n'}, '<leader>bd', dap.down)
