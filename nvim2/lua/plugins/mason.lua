return {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'angularls', -- Install Angular Language Server
        'tsserver',  -- TypeScript Server for TypeScript/JavaScript support
      },
    })
  end,
}
