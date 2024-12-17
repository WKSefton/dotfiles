return {
	"TimUntersberger/neogit",
	event = { "VeryLazy" },
	dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
	config = function()
		require("neogit").setup({
			integrations = {
				diffview = true, -- Optional: Integrate with diffview.nvim for enhanced diffs
			},
		})
	end,
}
