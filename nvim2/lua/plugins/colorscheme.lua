-- return {
--  "bluz71/vim-nightfly-guicolors",
--  priority = 1000,
--  config = function()
-- 	 vim.cmd([[colorscheme nightfly]])
--  end,
-- }
return {
	'folke/tokyonight.nvim',
	config = function()
	  vim.cmd('colorscheme tokyonight')
	end,
  }
  