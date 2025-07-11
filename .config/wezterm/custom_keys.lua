local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- Global commands
	{ key = "R", mods = "CTRL", action = act.ReloadConfiguration },
	{ key = "R", mods = "CTRL|ALT", action = act.ReloadConfiguration },
	{ key = "r", mods = "CTRL|ALT", action = act.ReloadConfiguration },
	{ key = "r", mods = "SUPER", action = act.ReloadConfiguration },
	{ key = "P", mods = "CTRL", action = act.ActivateCommandPalette },
	{ key = "p", mods = "CTRL|ALT", action = act.ActivateCommandPalette },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
	{ key = "L", mods = "CTRL|ALT", action = act.ShowDebugOverlay },
	{ key = "l", mods = "CTRL|ALT", action = act.ShowDebugOverlay },

	-- commands to switch modes
	{ key = "phys:Space", mods = "CTRL|ALT", action = act.QuickSelect },
	{ key = "x", mods = "CTRL|ALT", action = act.ActivateCopyMode },
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			prevent_fallback = false,
			replace_current = false,
			until_unknown = false,
		}),
	},

	{
		key = "a",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "activate_pane",
			one_shot = true,
			prevent_fallback = false,
			replace_current = false,
			timeout_milliseconds = 1000,
			until_unknown = false,
		}),
	},
	{
		key = ",",
		mods = "CMD",
		action = act.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
			},
			args = {
				os.getenv("SHELL"),
				"-c",
				"nvim " .. wezterm.shell_quote_arg(wezterm.config_file),
			},
		}),
	},
	-- Tab commands
	{ key = "T", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "T", mods = "CTRL|ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "w", mods = "CTRL|ALT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },

	-- Window commands
	{ key = "Enter", mods = "CTRL|ALT", action = act.ToggleFullScreen },
	{ key = "n", mods = "SUPER", action = act.SpawnWindow },

	-- Pane commands (Horizontal and Vertical are somewhat misnamed, IMHO...)
	{ key = "|", mods = "CTRL|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "_", mods = "CTRL|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "z", mods = "CTRL|ALT", action = act.TogglePaneZoomState },
	{ key = "LeftArrow", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "LeftArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "UpArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "DownArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },

	-- Font size
	{ key = ")", mods = "CTRL", action = act.ResetFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "_", mods = "CTRL", action = act.DecreaseFontSize },

	-- Copy and Paste
	{ key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
	{ key = "C", mods = "CTRL|ALT", action = act.CopyTo("Clipboard") },
	{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
	{ key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
	{ key = "v", mods = "CTRL|ALT", action = act.PasteFrom("Clipboard") },
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
	{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
	{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
	{ key = "F", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "F", mods = "CTRL|ALT", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "K", mods = "CTRL", action = act.ClearScrollback("ScrollbackOnly") },
	{ key = "K", mods = "CTRL|ALT", action = act.ClearScrollback("ScrollbackOnly") },
	{
		key = "U",
		mods = "CTRL",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{
		key = "U",
		mods = "CTRL|ALT",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "V", mods = "CTRL|ALT", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "CTRL|ALT", action = act.CopyTo("Clipboard") },
	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
	{ key = "f", mods = "CTRL|ALT", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "k", mods = "CTRL|ALT", action = act.ClearScrollback("ScrollbackOnly") },
	{ key = "k", mods = "SUPER", action = act.ClearScrollback("ScrollbackOnly") },
	{ key = "t", mods = "CTRL|ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
	{
		key = "u",
		mods = "CTRL|ALT",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
}
