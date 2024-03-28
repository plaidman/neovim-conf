-- ui options --
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- and relative numbers
vim.opt.timeoutlen = 300 -- shows the which-key dialog sooner
vim.opt.signcolumn = "yes" -- signcolumn for git symbols, folding, etc
vim.opt.cursorline = true -- highlight line your cursor is on
vim.opt.scrolloff = 5 -- number of lines to keep above and below cursor
vim.opt.colorcolumn = "120" -- 120 character column marker
vim.opt.termguicolors = true -- 24 bit color mode

-- searching and replacing --
vim.opt.ignorecase = true -- case-insensitive searching
vim.opt.smartcase = true -- unless there is a capital in the search string
vim.opt.inccommand = "split" -- preview :%s commands live as you type

-- window splits --
vim.opt.splitbelow = true -- h-splits open below
vim.opt.splitright = true -- v-splits open to the right
vim.opt.mouse = "a" -- enable mouse mode

-- tabs and spacing --
vim.opt.breakindent = true -- wrapped lines will have the same indentation as the first line
vim.opt.smartindent = true -- smart indent new lines
vim.opt.tabstop = 4 -- set tabstop width
vim.opt.shiftwidth = 4 -- auto indent width
vim.opt.softtabstop = 4 -- number of spaces <tab> key counts as
-- vim.opt.expandtab = true  -- convert <tab> keypresses to spaces

-- file processing
vim.opt.undofile = true -- save undo history between sessions
vim.opt.modeline = false -- ignore vim mode command lines in files
vim.opt.swapfile = false -- don't create a .swp file
vim.opt.updatetime = 250 -- time that CursorHold events fire after you stop typing
