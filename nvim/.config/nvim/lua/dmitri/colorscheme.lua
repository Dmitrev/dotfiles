local status_ok, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")

if not status_ok then 
    vim.notify("Could not load colorscheme");
end
