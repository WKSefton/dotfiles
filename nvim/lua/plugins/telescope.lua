return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope", -- Load when running Telescope commands
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local fb_actions = require("telescope._extensions.file_browser.actions")
		telescope.setup({
			defaults = {
				initial_mode = "insert",
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<Esc>"] = actions.close,
					},
					n = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["l"] = fb_actions.open,
							["yy"] = fb_actions.copy,
							["dd"] = fb_actions.remove,
						},
					},
				},
			},
		})
		telescope.load_extension("file_browser")
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set
		keymap("n", "<leader>fe", telescope.extensions.file_browser.file_browser, opts)
	end,
}
