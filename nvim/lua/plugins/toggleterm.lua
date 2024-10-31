return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {},
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "horizontal",
            })
            local keymap = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            keymap("n", "<leader>t", ":ToggleTerm<CR>", opts)
            keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
            keymap("n", "<leader>1", ":ToggleTerm 1<CR>", opts)
            keymap("n", "<leader>2", ":ToggleTerm 2<CR>", opts)
            keymap("n", "<leader>3", ":ToggleTerm 3<CR>", opts)
        end,
    },
}
