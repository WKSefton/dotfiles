local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- Setup handlers for LSP servers
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup {}
  end,
  ["omnisharp"] = function()
    require('configs.lsp.csharp')
  end,
  ["angularls"] = function()
    require('configs.lsp.angular')
  end,
})
