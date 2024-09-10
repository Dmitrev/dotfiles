local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
    { family = "PragmataPro Mono Liga", weight = "Regular"},
    -- { family = 'Berkeley Mono Variable', weight = "Regular" },
    -- family = 'SauceCodePro Nerd Font Mono',
    -- { family = 'Comic Code Ligatures', weight = "Regular"},
    -- { family = 'Codelia Ligatures', weight = "Regular" },
    -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    "Symbols Nerd Font"
}

-- Fixes weird issue with font sometimes having weird kerning
config.cell_width = 1

config.adjust_window_size_when_changing_font_size = false
-- config.freetype_load_target = 'Normal'
-- -- config.window_background_opacity = 0.8
-- config.freetype_render_target = 'Normal'
--
-- -- config.color_scheme = 'Oxocarbon Dark'
-- -- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
config.color_scheme = 'Nord (Gogh)'
-- -- config.color_scheme = 'Catppuccin Mocha'
--
config.font_size = 20
-- -- config.line_height = 1.2
--
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
--
config.hide_tab_bar_if_only_one_tab = true

-- For onboard GPU, should hopefully solve slowness
-- config.front_end = "WebGpu"
-- config.webgpu_power_preference = "LowPower"
-- config.front_end = "Software"
--
config.keys = {
    {
        key = "LeftArrow",
        mods = "CTRL | SHIFT",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "RightArrow",
        mods = "CTRL | SHIFT",
        action = wezterm.action.DisableDefaultAssignment,
    },
}

return config
