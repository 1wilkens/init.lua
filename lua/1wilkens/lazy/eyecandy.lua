return {
    -- tinted-nvim
    {
        "tinted-theming/tinted-nvim",

        config = function()
            require("tinted-nvim").setup({
                supports = {
                    tinty = true,
                    tinted_shell = true,
                },
                highlights = {
                    telescope = true,
                    telescope_borders = false,
                    indentblankline = true,
                    notify = true,
                    cmp = true,
                    ts_rainbow = true,
                    illuminate = true,
                    lsp_semantic = true,
                    mini_completion = true,
                    dapui = true,
                },
            })
        end,
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = { theme = "base16" },
            })
        end,
    },

    -- devicons
    "nvim-tree/nvim-web-devicons",
}
