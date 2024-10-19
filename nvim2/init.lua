require("core")
-- Define the path to lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is installed, if not, clone it
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable", -- latest stable release
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)
-- Load plugins
require('lazy').setup('plugins')
require("configs")
