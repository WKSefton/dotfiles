return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]], -- Toggle terminal with Ctrl + \
				direction = "horizontal", -- Options: 'horizontal', 'vertical', 'tab', 'float'
			})

			-- Additional keybindings for convenience
			local keymap = vim.api.nvim_set_keymap
			keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true }) -- Open/close terminal with <leader>t
			keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true }) -- Exit terminal mode with Esc
			keymap("n", "<leader>1", ":ToggleTerm 1<CR>", { noremap = true, silent = true })
			keymap("n", "<leader>2", ":ToggleTerm 2<CR>", { noremap = true, silent = true })
			keymap("n", "<leader>3", ":ToggleTerm 3<CR>", { noremap = true, silent = true })
		end,
	},
}
