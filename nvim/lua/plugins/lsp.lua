return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		event = "BufReadPre",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = "BufReadPre",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
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
			-- Configure other LSPs as needed
			lspconfig.ts_ls.setup({}) -- TypeScript/JavaScript LSP
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
		event = { "BufReadPre", "BufWritePre" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- Lua formatter
					null_ls.builtins.formatting.prettier, -- Prettier for JS/TS
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*", -- { "*.lua", "*.js", "*.ts", "*.cs", "*.csproj" }, -- Add other filetypes as needed
				callback = function()
					vim.lsp.buf.format({ async = true })
				end,
			})
		end,
	},
}
