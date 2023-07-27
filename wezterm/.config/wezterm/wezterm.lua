local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font(
    "Berkeley Mono Variable",
    { weight = 'Regular' }
)

config.freetype_load_target = 'Normal'
-- config.freetype_render_target = 'Normal'

config.color_scheme = 'Ayu Mirage'
config.font_size = 16

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
