return {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim"},
    lazy = true,
    cmd = "Neogit",
    config = function()
        require("neogit").setup({
            integrations = {
                diffview = true, -- Optional: Integrate with diffview.nvim for enhanced diffs
            },
        })
    end,
}
