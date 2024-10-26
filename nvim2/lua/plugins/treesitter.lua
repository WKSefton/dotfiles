return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c_sharp", "typescript", "javascript", "html", "css", "lua" },
            highlight = { enable = true },
        })
    end,
}

