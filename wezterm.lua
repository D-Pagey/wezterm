local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("MesloLGS NF")
config.font_size = 18.0
config.window_background_opacity = 0.85

config.keys = {
	{ key = "{", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
}

-- change the theme depending on if the sun is up in London
local suntime = wezterm.time.now():sun_times(51.5, -0.12)

if suntime.up and suntime.progression < 0.6 then
	config.color_scheme = "Gruvbox (Gogh)"
elseif suntime.up then
	config.color_scheme = "Catppuccin Macchiato (Gogh)"
elseif suntime.progression < 0.25 then
	config.color_scheme = "Gruvbox Dark (Gogh)"
else
	config.color_scheme = "Breath Darker (Gogh)"
end

return config
