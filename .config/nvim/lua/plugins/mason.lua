return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "delve",
      "lua-language-server"
    }
  },
  config = function()
    require("mason").setup()
  end

}
