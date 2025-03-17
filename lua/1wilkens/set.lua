-- set.lua - configure basic vim settings

-- setup
local opt = vim.opt
local HOME = os.getenv("HOME")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true

-- permanent undo
opt.undodir = HOME .. "/.vimdid"
opt.undofile = true

-- formatoptions defaults
-- FIXME: verify these are needed
local format = "tc"     -- wrap text and comments using textwidth
format = format .. "r"  -- continue comments when pressing ENTER in Insert mode
format = format .. "q"  -- enable formatting of comments with gq
format = format .. "n"  -- detect lists for formatting
format = format .. "b"  -- auto-wrap in Insert mode, and do not wrap old long lines
opt.formatoptions = format

-- diffopts
opt.diffopt:append { "algorithm:patience" }
opt.diffopt:append { "indent-heuristic" }

-- wildmenu
opt.wildmenu = true
opt.wildmode = "list:longest"
opt.wildignore = ".hg,.svn,.git,*~,*.png,*.jpg,*.gif,*.pdf,__pycache__,"

-- ui
opt.colorcolumn = "100"
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showmode = false

opt.scrolloff = 4

opt.list = true
opt.listchars = "nbsp:¬,extends:»,precedes:«,trail:•,tab:>-"

-- sane splits
opt.splitright = true
opt.splitbelow = true

-- misc
opt.timeoutlen = 500
opt.wrap = false

-- performance
-- FIXME: disable on bad connections
-- opt.ttyfast = true
-- FIXME: this should not be permanently enabled as per docs?
-- opt.lazyredraw = true

-- " Search with ripgrep if available
-- if executable('rg')
--     set grepprg=rg\ --no-heading\ --vimgrep
--     set grepformat=%f:%l:%c:%m
-- endif

-- " ======================
-- " # UI SETTINGS
-- " ======================
-- "
-- " General stuff
-- set vb t_vb=
-- set ruler
-- set ttyfast
-- set lazyredraw
-- set showcmd
-- set mouse=a
-- set colorcolumn=100
-- set laststatus=2

-- highlight yanked area
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 1000,
        })
    end,
})
