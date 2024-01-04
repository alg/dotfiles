-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 16.0

config.window_padding = {
    left = '2px',
    right = '2px',
    top = 0,
    bottom = 0,
}

config.use_fancy_tab_bar = false

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- and finally, return the configuration to wezterm
return config

