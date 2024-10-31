return {
    "ggandor/leap.nvim",
    config = function()
        require("leap").add_default_mappings() -- Sets default keybindings (s/S for search)
    end,
    keys = { "s", "S" },                 -- Loads leap.nvim when 's' or 'S' is pressed
}
