local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.softtabstop = 4
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = false -- highlight the current cursor line

-- appearance
opt.hlsearch = false
opt.incsearch = true

-- turn on termguicolors
-- (you have to use a true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.pumheight = 10 -- height of popup menu

opt.isfname:append("@-@")

opt.updatetime = 50

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile and backup
opt.swapfile = false
opt.backup = false

-- undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
-- vim.g.netrw_browse_split=4				-- open in prior window
-- vim.g.netrw_altv = 1					-- change from left splitting to right splitting
-- vim.g.netrw_liststyle=3					-- tree style view in netrw
--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")
opt.showtabline = 2 -- always show the tab line
