-- local theme = 'onedark';
 -- local dark = true;
 --
 -- if not dark then
 --     local status_ok, _ = pcall(vim.cmd, "set background=light")
 --     if not status_ok then 
 --         vim.notify("Could not set background to light");
 --     end
 -- end
 --
 -- local status_ok, _ = pcall(vim.cmd, "colorscheme "..theme)
 --
 -- if not status_ok then 
 --     vim.notify("Could not load colorscheme");
 -- end

require('onedark').setup {
    style = 'deep'
}
require('onedark').load()

