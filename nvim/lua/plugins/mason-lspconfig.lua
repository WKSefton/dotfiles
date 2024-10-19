return {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'omnisharp', 'angularls', 'tsserver' },
      }
    end,
  }
  