return {
	"akinsho/toggleterm.nvim",
	event = { "VeryLazy" },
	version = "*",
	opts = {},
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			size = 10,
			shading_factor = 2,
			direction = "float",
			float_opts = {
				border = "curved",
			},
		})

		vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
		vim.keymap.set("n", "<leader>1", ":ToggleTerm 1<CR>")
		vim.keymap.set("n", "<leader>2", ":ToggleTerm 2<CR>")
		vim.keymap.set("n", "<leader>3", ":ToggleTerm 3<CR>")
	end,
}
