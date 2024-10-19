return {
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            extensions = {
                file_browser = {
                    -- Your configuration for the file browser
                    hijack_netrw = true,
                },
            },
        }
        -- Load the extension
        telescope.load_extension('file_browser')
        -- Open file browser with Telescope
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        map('n', '<leader>fb', ':Telescope file_browser<CR>', opts)
    end,
}
