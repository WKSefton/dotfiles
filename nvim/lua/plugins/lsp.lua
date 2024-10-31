return {
    "williamboman/mason.nvim",
    lazy = true,
    event = "BufReadPre",
    dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("mason").setup({
            ensure_installed = { "luacheck", "csharpier", "golangci-lint", "stylua", "gofmt" },
            automatic_installation = true,
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "omnisharp",
                "angularls",
            },
            automatic_installation = true,
        })
        local lspconfig = require("lspconfig")
        lspconfig.angularls.setup({})
        lspconfig.omnisharp.setup({
            cmd = { "omnisharp" },
            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
        })
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Recognize 'vim' as a global variable
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = { enable = false },
                },
            },
        })
        lspconfig.ts_ls.setup({})
    end,
}
