local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end
config.font = wezterm.font 'PragmataPro Mono Liga'
config.color_scheme = 'Catppuccin Mocha'
config.font_size = 16
return config
