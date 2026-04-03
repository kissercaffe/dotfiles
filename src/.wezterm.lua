-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()
--
local act = wezterm.action

-- This is where you actually apply your config choices.
-- wsl
-- config.default_domain = 'WSL:Ubuntu-24.04'
config.default_prog = { 'wsl.exe', '-d', 'Ubuntu-24.04', '--cd', '~' }

config.tab_bar_at_bottom = true
config.initial_cols = 120
config.initial_rows = 28
config.font_size = 12
config.color_scheme = 'tokyonight_night' 
config.hide_tab_bar_if_only_one_tab = true
config.use_ime = true
config.window_close_confirmation = 'AlwaysPrompt'
config.enable_scroll_bar = true
config.default_cursor_style = 'BlinkingBlock'

config.colors = {
  tab_bar = {
    background = "#1b1f2f",

    active_tab = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = "#282d3e",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab_hover = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = true,
      strikethrough = false,
    },

    new_tab = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      italic = false
    },

    new_tab_hover = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
      italic = false
    },
  }
}

config.leader = { key="2", mods="CTRL", timeout_milliseconds=1000 }

config.keys = {
    { key = "q", mods = "LEADER", action = act.CloseCurrentTab{ confirm = true } },
    { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
    { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
    { key = "w", mods = "LEADER", action = act.ShowTabNavigator },

    { key = "v", mods = "LEADER", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
    { key = "s", mods = "LEADER", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
    { key = "x", mods = "LEADER", action = act.CloseCurrentPane{ confirm = true } },
    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "H", mods = "LEADER", action = act.AdjustPaneSize{"Left", 10} },
    { key = "L", mods = "LEADER", action = act.AdjustPaneSize{"Right", 10} },
    { key = "K", mods = "LEADER", action = act.AdjustPaneSize{"Up", 5} },
    { key = "J", mods = "LEADER", action = act.AdjustPaneSize{"Down", 5} },

    -- { key = "x", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
    { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

    { key = "Enter", mods = "ALT", action = 'DisableDefaultAssignment' },
}

config.audible_bell = "Disabled"

-- Finally, return the configuration to wezterm:DER", action = act.SpawnTab("CurrentPaneDomain") },
return config


