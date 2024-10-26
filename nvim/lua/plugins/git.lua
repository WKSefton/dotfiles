return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gb", ":Git branch<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gc", ":Git checkout ", { noremap = true })
	end,
}
