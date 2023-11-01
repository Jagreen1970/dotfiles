-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

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

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

config.leader = { key = 'Space', mods = 'CTRL|SHIFT' }
config.keys = {
  -- CTRL+SHIFT+Space, followed by 'r' will put us in resize-pane
  -- mode until we cancel that mode.
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },

  -- CTRL+SHIFT+Space, followed by 'a' will put us in activate-pane
  -- mode until we press some other key or until 1 second (1000ms)
  -- of time elapses
  {
    key = 'a',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'activate_pane',
      timeout_milliseconds = 1000,
    },
  },

  -- CTRL+SHIFT+Space, followed by 's' will put us in split-pane mode
  -- until we press some other key or until 1 second (1000ms)
  -- of time elapses
  {
    key = 's',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'split_pane',
      timeout_milliseconds = 1000,
    },
  },

}

config.key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  resize_pane = {
    { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape',     action = 'PopKeyTable' },
  },

  -- Defines the key bindings for the 'split_pane'.
  split_pane = {
    { key = 'RightArrow', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'l',          action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'DownArrow',  action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'j',          action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  },

  -- Defines the keys that are active in our activate-pane mode.
  -- 'activate_pane' here corresponds to the name="activate_pane" in
  -- the key assignments above.
  activate_pane = {
    { key = 'LeftArrow',  action = act.ActivatePaneDirection 'Left' },
    { key = 'h',          action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l',          action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    action = act.ActivatePaneDirection 'Up' },
    { key = 'k',          action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  action = act.ActivatePaneDirection 'Down' },
    { key = 'j',          action = act.ActivatePaneDirection 'Down' },
  },
}

-- and finally, return the configuration to wezterm
return config
