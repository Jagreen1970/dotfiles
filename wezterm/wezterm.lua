-- Pull in the wezterm API
local wezterm = require("wezterm")
-- local act = wezterm.action
local mux = wezterm.mux

-- Maximize window on gui_startup
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
    local name = window:active_key_table()
    if name then
        name = "TABLE: " .. name
    end
    window:set_right_status(name or "")
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- color scheme:
config.color_scheme = "rose-pine-moon"

-- font settings:
config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

-- tabs:
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- window settings:
config.window_background_opacity = 0.9
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "zsh", "sh", "bash", "fish", "tmux" }
config.scrollback_lines = 5000

config.window_frame = {
    font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
}

-- key bindings
config.use_dead_keys = false
config.disable_default_key_bindings = true

config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 2000 }

config.key_tables = require("key_tables")
config.keys = require("custom_keys")

-- and finally, return the configuration to wezterm
return config
