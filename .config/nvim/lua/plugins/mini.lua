return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.icons").setup({ style = "glyph" })
    require("mini.move").setup({ use_icons = true })
    require("mini.starter").setup({ use_icons = true })
    require("mini.statusline").setup({ use_icons = true })
  end
}
