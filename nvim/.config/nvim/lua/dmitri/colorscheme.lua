require('onedark').setup({
  style = 'warmer'
})

require('onedark').load()


require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

require("rose-pine").setup({
  -- dark_variant = "moon" 
})
-- vim.o.background = "light"
-- vim.cmd('colorscheme rose-pine')
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme kanagawa")

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
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
