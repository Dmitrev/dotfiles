local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font(
    "PragmataPro",
    { weight = 'Regular' }
)

config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'

config.color_scheme = 'Catppuccin Mocha'
config.font_size = 14
return config
