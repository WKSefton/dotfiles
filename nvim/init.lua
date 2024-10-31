require("keybinds")
require("preferences")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()

        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "github_dark_default" } },
    checker = { enabled = true },
    {
        ui = {
            border = "rounded", -- Customize the border style if desired
        },
        performance = {
            rtp = {
                disabled_plugins = { -- Disable unneeded built-in plugins for faster startup
                    "gzip",
                    "matchit",
                    "matchparen",
                    "netrwPlugin",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "zipPlugin",
                },
            },
        },
    },
})

-- Disable unnecessary built-in plugins
-- local disabled_builtins = {
--   "gzip", "tar", "tarPlugin", "zip", "zipPlugin",
--     "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
--       "2html_plugin", "logiPat", "rrhelper", "netrw", "netrwPlugin"
--       }
--
--       for _, plugin in pairs(disabled_builtins) do
--         vim.g["loaded_" .. plugin] = 1
--         end
--
