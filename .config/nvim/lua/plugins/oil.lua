return {
	"stevearc/oil.nvim",
	lazy = true,
	cmd = { "Oil", "OilBrowse" },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		local actions = require("oil.actions")
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				-- "permissions",
				"size",
				-- "mtime",
			},
			delete_to_trash = false,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			keymaps = {
				["g?"] = actions.show_help,
				["q"] = actions.close,
				["<CR>"] = actions.select,
				["<C-p>"] = actions.preview,
				["<C-c>"] = actions.close,
				["<C-l>"] = actions.refresh,
				["-"] = actions.parent,
				["_"] = actions.open_cwd,
				["`"] = actions.cd,
				["~"] = {
					actions.cd,
					opts = { scope = "tab" },
					desc = ":tcd to the current oil directory",
					mode = "n",
				},
				["gs"] = actions.change_sort,
				["gx"] = actions.open_external,
				["g."] = actions.toggle_hidden,
				["g\\"] = actions.toggle_trash,
			},
			lsp_file_methods = {
				enabled = false,
			},
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				is_always_hidden = function(name, bufnr)
					return false
				end,
				natural_order = true,
				case_insensitive = false,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
		})
	end,
}
