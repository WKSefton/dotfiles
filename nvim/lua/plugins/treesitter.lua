return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically update parsers after installation
    config = function()
        require("nvim-treesitter.configs").setup({
            modules = {},
            auto_install = true,
            sync_install = true,
            ignore_install = {},
            ensure_installed = { "lua", "javascript", "c_sharp", "html", "css" }, -- Add languages you use
            highlight = {
                enable = true,                                           -- Enable Tree-sitter based syntax highlighting
            },
            indent = {
                enable = true, -- Enable Tree-sitter based indentation
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to the text object
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        })
    end,
}
