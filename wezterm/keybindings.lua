local wezterm = require 'wezterm'

return {
  keys = {

    -- Window Resizing (ALT + Arrow Keys)
    { key = "UpArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize { "Up", 2 } },     -- Increase window height
    { key = "DownArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize { "Down", 2 } },  -- Decrease window height
    { key = "RightArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize { "Right", 2 } },  -- Increase window width
    { key = "LeftArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize { "Left", 2 } },  -- Decrease window width


    -- Pane Navigation (ALT + SHIFT + Arrow Keys)
    { key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },   -- Move to the pane on the left
    { key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") }, -- Move to the pane on the right
    { key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },       -- Move to the pane above
    { key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },   -- Move to the pane below
    -- Split Panes (ALT + H for Horizontal, ALT + V for Vertical)
    { key = "H", mods = "ALT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } }, -- Split horizontally
    { key = "V", mods = "ALT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },   -- Split vertically
    -- Close the current pane with ALT + W
    { key = "W", mods = "ALT", action = wezterm.action.CloseCurrentPane { confirm = true } },
  }
}

