vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4


-- General Neovim options for Windows optimization
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
vim.opt.shellxquote = ''
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'

-- Disable unnecessary built-in plugins
local disabled_builtins = {
  "gzip", "tar", "tarPlugin", "zip", "zipPlugin",
  "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
  "2html_plugin", "logiPat", "rrhelper", "netrw", "netrwPlugin"
}

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 1
end

-- vim.opt.updatetime = 300
-- vim.opt.timeoutlen = 500

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.clipboard = 'unnamedplus'
