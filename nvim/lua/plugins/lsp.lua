return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("mason").setup({
            PATH = "prepend",
            ensure_installed = { "selene", "csharpier", "golangci-lint", "stylua", "gofmt" },
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
                    runtime = {
                        version = "LuaJIT", -- Set Lua version
                        path = vim.split(package.path, ";"),
                    },
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
