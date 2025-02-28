return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.icons').setup()
    -- require('mini.surround').setup()
    -- require('mini.jump2d').setup()
    require('mini.move').setup()
    require('mini.starter').setup()
    require('mini.statusline').setup({ use_icons = true })
  end
}
