return {
    "nvim-telescope/telescope.nvim",
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
                file_ignore_patterns = {},
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
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
                    hidden = true, -- Show hidden files
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

        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
        vim.keymap.set("n", "<leader>fe", telescope.extensions.file_browser.file_browser)

        -- vim.keymap.set("n", "<leader>gs", builtin.git_status)
        vim.keymap.set("n", "<leader>gb", builtin.git_branches)
        vim.keymap.set("n", "<leader>gc", builtin.git_commits)
        vim.keymap.set("n", "<leader>gC", builtin.git_bcommits)
    end,
}
