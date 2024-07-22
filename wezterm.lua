-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "Kanagawa (Gogh)"
config.font_size = 18.0
config.font = wezterm.font("MesloLGS NF")

config.keys = {
	{ key = "{", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
}

config.background = {
	{
		source = {
			Color = "#1F1F28",
		},
		width = "100%",
		height = "100%",
		opacity = 0.90,
	},
}

return config
