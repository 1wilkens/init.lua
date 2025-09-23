return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "j-hui/fidget.nvim",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        -- setup cmp
        local cmp = require('cmp')

        -- setup fidget
        require("fidget").setup({})

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'luasnip' },
            })
        })

        -- enable servers
        vim.lsp.enable('bashls')
        vim.lsp.enable('biome')
        vim.lsp.enable('basedpyright')
        vim.lsp.enable('dockerls')
        vim.lsp.enable('gitlab_ci_ls')
        vim.lsp.enable('gopls')
        vim.lsp.enable('harper_ls')
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('marksman')
        vim.lsp.enable('nil_ls')
        vim.lsp.enable('rust_analyzer')
        vim.lsp.enable('systemd_ls')

        -- configure diagnostics
        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                --source = "always",
                header = "",
                prefix = "",
            },
        })

        -- configure servers

        -- make lua_ls aware of neovims modules
        vim.lsp.config('lua_ls', {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT',
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })
    end
}
