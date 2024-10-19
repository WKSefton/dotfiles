local lspconfig = require('lspconfig')

lspconfig.omnisharp.setup {
  cmd = { "omnisharp" },
  -- Additional configuration
  handlers = {
    -- Fix for issue with omnisharp
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
}
