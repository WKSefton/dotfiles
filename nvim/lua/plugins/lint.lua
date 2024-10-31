return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        -- Configure linters for each language
        lint.linters_by_ft = {
            lua = { "selene" }, -- Lua linter
            cs = { "csharpier" }, -- C# linter (or other if preferred)
            go = { "golangci-lint" }, -- Go linter
        }

        -- Run linting on save
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint() -- Triggers linting on save
            end,
        })
    end,
}
