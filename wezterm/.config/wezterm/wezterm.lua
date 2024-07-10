local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
    { family = "PragmataPro Mono Liga", weight = "Regular"},
    -- { family = 'Berkeley Mono Variable', weigth = "Regular" },
    -- family = 'SauceCodePro Nerd Font Mono',
    -- family = 'Comic Code Ligatures',
    -- family = 'Codelia Ligatures',
    -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    "Symbols Nerd Font"
}

config.adjust_window_size_when_changing_font_size = false
config.freetype_load_target = 'Normal'
-- config.window_background_opacity = 0.8
-- config.freetype_render_target = 'Normal'

-- config.color_scheme = 'Oxocarbon Dark'
-- config.color_scheme = 'Kanagawa (Gogh)'
config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'Catppuccin Mocha'

config.font_size = 16
-- config.line_height = 1.2

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
