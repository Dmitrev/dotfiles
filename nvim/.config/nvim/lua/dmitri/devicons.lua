local ok, plugin = pcall(require, 'nvim-web-devicons')

if ok then
    plugin.setup {
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
     },
    override_by_filename = {
      ["dot-gitignore"] = {
        icon = "",
        color = "#F14C2F",
        cterm_color = "196",
        name = "Gitignore",
      },

      ["dot-gitconfig"] = {
        icon = "",
        color = "#F14C2F",
        cterm_color = "196",
        name = "Gitconfig",
      },
    },
      -- globally enable different highlight colors per icon (default to true)
     -- if set to false all icons will have the default icon's color
     color_icons = true;
     -- globally enable default icons (default to false)
     -- will get overriden by `get_icons` option
     default = true;
    }
end
