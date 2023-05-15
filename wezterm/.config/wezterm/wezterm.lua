local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font(
    "PragmataPro",
    { weight = 'Regular' }
)

config.freetype_load_target = 'Normal'
-- config.freetype_render_target = 'Normal'

config.color_scheme = 'Catppuccin Mocha'
config.font_size = 14

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
