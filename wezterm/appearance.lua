
local wezterm = require 'wezterm'

return {
  font = wezterm.font("FiraCode Nerd Font"),  -- Corrected to use wezterm.font() function
  font_size = 12.0,
  hide_tab_bar_if_only_one_tab = true,
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },
}

