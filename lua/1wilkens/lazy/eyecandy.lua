return {
    -- tinted-nvim
    {
        "tinted-theming/tinted-nvim",

        config = function()
            require("tinted-colorscheme").setup({
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

    -- lightline
    "itchyny/lightline.vim",

    -- devicons
    "kyazdani42/nvim-web-devicons",
}
