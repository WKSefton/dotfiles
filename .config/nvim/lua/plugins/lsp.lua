return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
          },
        },
      },
      gopls = {}
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')

    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          -- group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
          end,
        })
      end
    end

    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufopts = { buffer = args.buf }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, bufopts)
      end,
    })
  end
}
