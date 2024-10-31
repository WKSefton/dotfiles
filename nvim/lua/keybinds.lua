vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "gD", vim.lsp.buf.declaration, opts)
keymap("n", "gy", vim.lsp.buf.type_definition, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "gi", vim.lsp.buf.implementation, opts)
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
-- keymap("n", "<leader>fd", vim.lsp.buf.format, opts)

keymap("n", "<leader>+", ":resize +5<CR>", opts)
keymap("n", "<leader>-", ":resize -5<CR>", opts)
keymap("n", "<leader>>", ":vertical resize +5<CR>", opts)
keymap("n", "<leader><", ":vertical resize -5<CR>", opts)

keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)

keymap("v", "<A-Up>", ":m .-2<CR>gv=gv", opts)
keymap("v", "<A-Down>", ":m .+1<CR>gv=gv", opts)

keymap("n", "<A-Enter>", "o<Esc>", opts)
keymap("n", "<A-S-Enter>", "O<Esc>", opts)

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
--keymap("n", "<leader>fe", telescope.extensions.file_browser.file_browser, opts)

keymap("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

keymap("n", "<leader>fd", ":Format<CR>", opts)

keymap("n", "<leader>gs", ":Neogit<CR>", opts)
