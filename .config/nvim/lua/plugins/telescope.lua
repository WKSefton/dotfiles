return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-file-browser.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require("telescope")
    -- local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local fb_actions = require("telescope._extensions.file_browser.actions")

    telescope.setup({
      defaults = require("telescope.themes").get_ivy(),
      extensions = {
        fzf = {},
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
        }
      }
    })
    telescope.load_extension('fzf')

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
    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
    vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)

    vim.keymap.set("n", "<space>en", function()
      require('telescope.builtin').find_files({
        cwd = vim.fn.stdpath("config")
      })
    end)
    vim.keymap.set("n", "<space>ep", function()
      require('telescope.builtin').find_files({
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      })
    end)
  end
}
