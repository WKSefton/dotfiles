return {
    "lewis6991/gitsigns.nvim",
    lazy = false, -- Load at startup since it's a common utility
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            current_line_blame = true, -- Shows git blame for the current line
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                -- Keybindings for Git actions
                local keymap = vim.api.nvim_buf_set_keymap
                keymap(
                    bufnr,
                    "n",
                    "]c",
                    "<cmd>lua require('gitsigns').next_hunk()<CR>",
                    { noremap = true, silent = true }
                )
                keymap(
                    bufnr,
                    "n",
                    "[c",
                    "<cmd>lua require('gitsigns').prev_hunk()<CR>",
                    { noremap = true, silent = true }
                )
                keymap(
                    bufnr,
                    "n",
                    "<leader>hs",
                    "<cmd>lua require('gitsigns').stage_hunk()<CR>",
                    { noremap = true, silent = true }
                )
                keymap(
                    bufnr,
                    "n",
                    "<leader>hu",
                    "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
                    { noremap = true, silent = true }
                )
                keymap(
                    bufnr,
                    "n",
                    "<leader>hr",
                    "<cmd>lua require('gitsigns').reset_hunk()<CR>",
                    { noremap = true, silent = true }
                )
                keymap(
                    bufnr,
                    "n",
                    "<leader>hp",
                    "<cmd>lua require('gitsigns').preview_hunk()<CR>",
                    { noremap = true, silent = true }
                )
                keymap(
                    bufnr,
                    "n",
                    "<leader>hb",
                    "<cmd>lua require('gitsigns').blame_line()<CR>",
                    { noremap = true, silent = true }
                )
            end,
        })
    end,
}
