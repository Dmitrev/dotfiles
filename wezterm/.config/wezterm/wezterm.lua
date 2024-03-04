local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font(
    "Berkeley Mono Variable",
    -- "PragmataPro Mono Liga",
    { weight = 'Regular' }
)

config.freetype_load_target = 'Normal'
-- config.freetype_render_target = 'Normal'

config.color_scheme = 'Tokyo Night'

config.font_size = 18
config.line_height = 1.2

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

-- For onboard GPU, should hopefully solve slowness
-- config.front_end = "WebGpu"
-- config.webgpu_power_preference = "LowPower"
-- config.front_end = "Software"

return config
