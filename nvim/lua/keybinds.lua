vim.g.mapleader = " "

vim.g.maplocalleader = " "

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>+", ":resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", ":resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>>", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><", ":vertical resize -5<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

vim.keymap.set("v", "<A-Up>", ":m .-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m .+1<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<A-Enter>", "o<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-S-Enter>", "O<Esc>", { noremap = true, silent = true })
