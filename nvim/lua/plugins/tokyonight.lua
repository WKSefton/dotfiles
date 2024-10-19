return {
    'folke/tokyonight.nvim',
    lazy = false,    -- Make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- Ensure it loads first
    config = function()
      -- Load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
  