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
    -- vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, bufopts)
    -- vim.keymap.set({ "n", "i" }, '<C-k>', vim.lsp.buf.signature_help, bufopts)
  end,
})
vim.lsp.config.zig = {
  cmd = { "zls" },
  filetypes = { "zig" },
  root_markers = { "build.zig", ".git" },
  settings = {
    zls = {
      semantic_tokens = "full",
      enable_inlay_hints = true,
      enable_snippets = true,
      warn_style = true,
      highlight_global_var_declarations = true,
      -- Add other ZLS-specific settings as needed
    }
  },
}
vim.lsp.enable("zig")
vim.lsp.config.cssls = {
  cmd = { "css-lsp", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { ".git", "package.json" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
vim.lsp.enable("cssls")

vim.lsp.config.eslint = {
  cmd = { "eslint-lsp", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yml", "package.json", ".git" },
  settings = {
    -- Typically you want to disable formatting if you use another tool like Prettier:
    format = { enable = false },
  },
}
vim.lsp.enable("eslint")

vim.lsp.config.html = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "javascriptreact", "typescriptreact" },
  root_markers = { ".git", "package.json" },
  settings = {
    html = {
      format = {
        wrapLineLength = 120,
        unformatted = "pre,code,textarea", -- adjust as needed
      },
      suggest = {
        emmet = true,
      },
    },
  },
}
vim.lsp.enable("html")
vim.lsp.config.tsserver = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
}
vim.lsp.enable("tsserver")

vim.lsp.config.tailwind = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
  root_markers = { "tailwind.config.js", "tailwind.config.cjs", "postcss.config.js", "package.json", ".git" },
}
vim.lsp.enable("tailwind")

vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gotempl", "gowork", "gomod" },
  root_dir = { ".git", "go.mod", "go.work", vim.uv.cwd() },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      hints = {
        onlyLiteralFields = true,
        constantValues = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
vim.lsp.enable("gopls")

vim.lsp.config.luals = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        diagnostics = { globals = { "vim" } },
      }
    }
  }
}
vim.lsp.enable('luals')

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})
