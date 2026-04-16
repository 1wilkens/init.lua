-- cmd.lua - define custom commands

-- trim trailing whitespaces
vim.api.nvim_create_user_command("TrimTrailing", function()
    vim.cmd([[ %s/\s\+$// ]])
end, {})

-- tinty hook
local default_theme = "base16-atelier-dune"

local function get_tinty_theme()
    local theme = vim.fn.system("tinty current 2>/dev/null")
    if vim.v.shell_error ~= 0 then
        return default_theme
    end
    return vim.trim(theme)
end

local function apply_tinty_theme()
    local theme = get_tinty_theme()
    if vim.g.colors_name ~= theme then
        vim.cmd("colorscheme " .. theme)
        -- reload lightline after colorscheme change
        -- vim.fn["lightline#init"]()
        -- vim.fn["lightline#colorscheme"]()
        -- vim.fn["lightline#update"]()
    end
end

-- Apply on startup
apply_tinty_theme()

-- Re-apply when nvim regains focus (e.g. after tinty apply in another window)
vim.api.nvim_create_autocmd("FocusGained", {
    callback = apply_tinty_theme,
})
