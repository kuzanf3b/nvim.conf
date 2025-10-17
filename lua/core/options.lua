-- OPTIONS
local opts = vim.opt

-- line numbers 
opts.number = true
opts.relativenumber = true

-- indentation and tabs
opts.tabstop = 4
opts.shiftwidth = 4
opts.autoindent = true
opts.expandtab = true

-- search settings
opts.ignorecase = true
opts.smartcase = true

-- appearance
opts.termguicolors = true
opts.background = "dark"
opts.signcolumn = "yes"

-- cursor line
opts.cursorline = true

-- 80th column
opts.colorcolumn = "120"

-- clipboard
opts.clipboard:append("unnamedplus")

-- backspace
opts.backspace = "indent,eol,start"

-- split windows
opts.splitbelow = true
opts.splitright = true

-- dw/diw/ciw works on full-word
opts.iskeyword:append("-")

-- keep cursor at least 8 rows from top/bot
opts.scrolloff = 8

-- undo dir settings
opts.swapfile = false
opts.backup = false
opts.undodir = os.getenv("HOME") .. "/.vim/undodir"
opts.undofile = true

-- incremental search
opts.incsearch = true

-- faster cursor hold
opts.updatetime = 50
