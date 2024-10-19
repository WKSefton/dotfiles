local lspconfig = require('lspconfig')
local omnisharp_extended = require('omnisharp_extended')

lspconfig.omnisharp.setup {
  cmd = { "omnisharp" },
  handlers = {
    ["textDocument/definition"] = omnisharp_extended.handler,
  },
}
