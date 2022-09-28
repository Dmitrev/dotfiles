vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

local status_ok, _ = pcall(vim.cmd, "colorscheme catppuccin")

if not status_ok then 
    vim.notify("Could not load colorscheme");
end
