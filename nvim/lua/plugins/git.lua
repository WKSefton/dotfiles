return {
	"tpope/vim-fugitive",
	lazy = true,
	cmd = { "Git", "Gwrite", "Gread" }, -- Load on git commands
	config = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gb", ":Git branch<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gc", ":Git checkout ", { noremap = true })
	end,
}
