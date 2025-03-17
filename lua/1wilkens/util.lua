-- util.lua - useful utility functions

local M = {}

M.pwd_inside_git_repo = function()
  -- search for a directory named ".git" starting from $PWD upward
  local git_dir = vim.fn.finddir(".git", ".;")
  return git_dir ~= ""
end

return M
