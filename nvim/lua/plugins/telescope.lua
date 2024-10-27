return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        local fb_actions = require('telescope._extensions.file_browser.actions')
        telescope.setup {
            defaults = {
                initial_mode = "insert",
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<Esc>'] = actions.close,
                    },
                    n = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['q'] = actions.close,
                    },
                },
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    mappings = {
                        ['i'] = {
                            ['<C-w>'] = function() vim.cmd('normal vbd') end,
                        },
                        ['n'] = {
                            ['N'] = fb_actions.create,
                            ['h'] = fb_actions.goto_parent_dir,
                            ['l'] = fb_actions.open,
                            ['yy'] = fb_actions.copy,
                            ['dd'] = fb_actions.remove,
                        },
                    },
                },
            },
        }
        -- Load Telescope extensions
        telescope.load_extension('file_browser')
        -- Keybindings for launching Telescope pickers
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set
        keymap('n', '<leader>ff', builtin.find_files, opts)
        keymap('n', '<leader>fg', builtin.live_grep, opts)
        keymap('n', '<leader>fb', builtin.buffers, opts)
        keymap('n', '<leader>fh', builtin.help_tags, opts)
        keymap('n', '<leader>fo', builtin.oldfiles, opts)
        keymap('n', '<leader>fe', telescope.extensions.file_browser.file_browser, opts)
    end,
}
