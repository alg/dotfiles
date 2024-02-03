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
config.color_scheme = 'Catppuccin Mocha'

-- Font
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 16.0

-- Window
config.window_decorations = 'RESIZE'
config.window_padding = {
    left = '2px',
    right = '2px',
    top = 0,
    bottom = 0,
}

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Key mappings
config.keys = {
    -- split panes
    { key = 'd', mods = 'CMD', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
    { key = 'D', mods = 'CMD|SHIFT', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },
}

-- and finally, return the configuration to wezterm
return config

