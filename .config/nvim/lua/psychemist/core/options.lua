vim.g.netrw_liststyle = 3 -- set netrw directory view to tree style

local opt = vim.opt

-- line numbers and wrapping
opt.relativenumber = true
opt.number = true
-- opt.wrap = false -- disable line wrapping

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.softtabstop = 4 -- 4 spaces for tab when editing
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- highlight search text
opt.incsearch = true -- highlight characters incrementally while searching

-- appearance
opt.cursorline = true -- highlight the current cursor line
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
-- opt.termguicolors = true

-- comments
vim.api.nvim_set_hl(0, "Comment", { fg = "#6e6a86", italic = true }) -- make comments appear in italic
vim.api.nvim_set_hl(0, "@comment", { italic = true }) -- set in treesitter as well

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- swap, backup, undo files
opt.swapfile = false -- store .swp files on os crash
opt.backup = false -- store backup files
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set undo history file directory
opt.undofile = true -- keep undo history file

-- scroll and column settigs
opt.scrolloff = 8 -- keep at least 8 lines of padding above and below cursor when scrolling
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.colorcolumn = "80" -- draw a vertical line at column 80

-- vim configs
opt.updatetime = 50
opt.isfname:append("@-@") -- extend valid filename characters
