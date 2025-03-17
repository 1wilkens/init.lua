return {
    "nvim-telescope/telescope.nvim",

    branch = "0.1.x",

    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },

    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")
        local util = require("1wilkens.util")

        -- <C-p> search (git) files
        vim.keymap.set("n", "<C-p>", function()
            -- use git_files if inside a .git repo, default to find_files otherwise
            if util.pwd_inside_git_repo() then
                builtin.git_files({ recurse_submodules = true })
            else
                builtin.find_files({ hidden = true, follow = true })
            end
        end)

        -- <C-o> live grep
        vim.keymap.set("n", "<C-o>", function()
           builtin.live_grep({})
        end)

        -- FIXME: decide if I want any other keybinds here

        -- vim.keymap.set("n", "<leader>pws", function()
        --     local word = vim.fn.expand("<cword>")
        --     builtin.grep_string({ search = word })
        -- end)
        -- vim.keymap.set("n", "<leader>pWs", function()
        --     local word = vim.fn.expand("<cWORD>")
        --     builtin.grep_string({ search = word })
        -- end)
        -- vim.keymap.set("n", "<leader>ps", function()
        --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
        -- end)
        -- vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end
}
