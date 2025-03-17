-- cmd.lua - define custom commands

-- trim trailing whitespaces
vim.api.nvim_create_user_command("TrimTrailing", function()
  vim.cmd([[ %s/\s\+$// ]])
end, {})
