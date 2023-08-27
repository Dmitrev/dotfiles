-- vim.o.background = "light"
-- vim.cmd("colorscheme ayu-mirage")
-- vim.cmd("colorscheme melange")
-- vim.cmd("colorscheme nightfly")
-- vim.cmd("colorscheme tender")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme bamboo")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme tokyonight-night")
vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme everblush")
-- vim.cmd("colorscheme spaceduck")
-- vim.cmd("colorscheme nordic")
-- vim.cmd("colorscheme mellifluous")
-- vim.cmd("colorscheme onenord")
-- vim.cmd("colorscheme alabaster")
-- vim.cmd("colorscheme noctis")

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  css = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "CSS"
  },
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
