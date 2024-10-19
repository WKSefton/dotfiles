
local wezterm = require 'wezterm'

-- Load configurations from other files
local keybindings = require 'keybindings'
local appearance = require 'appearance'
local panes = require 'panes'

-- Merge all configurations into a single return statement
return {
  -- Set the default shell to Git Bash
    -- Set the default shell to PowerShell Core
    -- default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" },
  -- default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" },

  -- Appearance settings
  font = appearance.font,
  font_size = appearance.font_size,
  hide_tab_bar_if_only_one_tab = appearance.hide_tab_bar_if_only_one_tab,
  inactive_pane_hsb = appearance.inactive_pane_hsb,

  -- Keybindings for pane management
  keys = keybindings.keys,

  -- Pane management
  window_decorations = panes.window_decorations,
}

