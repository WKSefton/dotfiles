return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "tailwindcss-language-server",
      "typescript-language-server",
      "eslint-lsp",
      "prettierd",
      "json-lsp",
      "gopls",
      "delve",
      "lua-language-server"
    }
  },
  config = function()
    require("mason").setup()
  end

}
