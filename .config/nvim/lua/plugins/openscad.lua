return {
    'salkin-mada/openscad.nvim',
    config = function()
        require('openscad')
        vim.g.openscad_default_mappings = true
        vim.g.openscad_fuzzy_finder = 'fzf'
        vim.g.openscad_cheatsheet_window_blend = 15 --%
        vim.g.openscad_load_snippets = false
        -- should the openscad project automatically be opened on startup
        vim.g.openscad_auto_open = false
        vim.g.openscad_cheatsheet_toggle_key = '<Enter>'
        vim.g.openscad_help_trig_key = '<A-h>'
        vim.g.openscad_help_manual_trig_key = '<A-m>'
        vim.g.openscad_exec_openscad_trig_key = '<A-o>'
        vim.g.openscad_top_toggle = '<A-c>'
        -- load snippets, note requires
        vim.g.openscad_load_snippets = true
    end,
    requires = 'L3MON4D3/LuaSnip'
}
