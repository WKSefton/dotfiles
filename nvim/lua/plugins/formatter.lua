return {
    "mhartington/formatter.nvim",
    lazy = true,
    cmd = { "Format", "FormatWrite" }, -- Loads when you use Format commands
    config = function()
        require("formatter").setup({
            logging = false,
            filetype = {
                lua = {
                    function()
                        return {
                            exe = "stylua",
                            args = { "--indent-type", "Spaces", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "-" },
                            stdin = true,
                        }
                    end,
                },
                csharp = {
                    function()
                        return {
                            exe = "dotnet-format",
                            args = { vim.api.nvim_buf_get_name(0) }, -- Format current file
                            stdin = false, -- dotnet-format does not use stdin
                        }
                    end,
                },
                go = {
                    function()
                        return {
                            exe = "gofmt", -- Or use "goimports" for formatting + imports
                            args = {},
                            stdin = true,
                        }
                    end,
                },
            },
        })

        -- Set up format on save for specified filetypes
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.lua", "*.go", "*.cs" }, -- Add more filetypes here if needed
            command = "FormatWrite",
        })
    end,
}
