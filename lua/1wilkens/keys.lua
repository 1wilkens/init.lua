-- keys.lua - define key mappings

local keys = vim.keymap

-- ; as :
keys.set("n", ";", ":")

-- no arrow keys..
keys.set("n", "<up>", "<nop>")
keys.set("n", "<down>", "<nop>")
-- keys.set("i", "<up>", "<nop>")
-- keys.set("i", "<down>", "<nop>")
-- keys.set("i", "<left>", "<nop>")
-- keys.set("i", "<right>", "<nop>")

-- left and right can switch buffers
keys.set("n", "<left>", ":bp<CR>")
keys.set("n", "<right>", ":bn<CR>")

-- move by line
keys.set("n", "j", "gj")
keys.set("n", "k", "gk")

-- search results centered please
keys.set("n", "n", "nzz", { silent = true })
keys.set("n", "N", "Nzz", { silent = true })
keys.set("n", "*", "*zz", { silent = true })
keys.set("n", "#", "#zz", { silent = true })
keys.set("n", "g*", "g*zz", { silent = true })

-- open hotkeys
--
-- map <C-Space> :Goyo<CR>

-- suspend with Ctrl-F
keys.set("i", "<C-f>", "<Esc>:sus<CR>")
keys.set("v", "<C-f>", "<Esc>:sus<CR>")
keys.set("n", "<C-f>", ":sus<CR>")
