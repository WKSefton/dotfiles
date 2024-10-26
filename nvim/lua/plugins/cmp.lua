-- lua/plugins/cmp.lua

return {

	-- Main autocompletion plugin

	"hrsh7th/nvim-cmp",

	dependencies = {

		-- LSP completion source

		"hrsh7th/cmp-nvim-lsp",

		-- Buffer completion source (current file content)

		"hrsh7th/cmp-buffer",

		-- Snippet engine (optional but useful)

		"L3MON4D3/LuaSnip",

		-- Snippet completion source

		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		cmp.setup({

			snippet = {

				-- REQUIRED - You must specify a snippet engine

				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users
				end,
			},

			mapping = cmp.mapping.preset.insert({

				["<C-d>"] = cmp.mapping.scroll_docs(-4),

				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<C-Space>"] = cmp.mapping.complete(),

				["<C-e>"] = cmp.mapping.abort(),

				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
			}),

			sources = cmp.config.sources({

				{ name = "nvim_lsp" }, -- LSP completion

				{ name = "luasnip" }, -- Snippet completion
			}, {

				{ name = "buffer" }, -- Buffer completion
			}),
		})
	end,
}
