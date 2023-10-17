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

-- For example, changing the color scheme:
-- config.color_scheme = 'catppuccin-mocha'
config.color_scheme = 'rose-pine-moon'
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14

-- and finally, return the configuration to wezterm
return config

