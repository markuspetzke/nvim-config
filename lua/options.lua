local vim = vim
local opt = vim.opt
vim.g.autoformat = true
vim.g.have_nerd_font = true
vim.opt.showmode = false
vim.o.cmdheight = 0
vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.opt.relativenumber = true
vim.opt.encoding = 'utf-8'
vim.opt.title = false
vim.opt.termguicolors = true
vim.opt.linebreak = true
vim.opt.grepformat = '%f:%l:%c:%m'

-- Am Ende von options.lua hinzufügen:

-- Performance für High Refresh Rate
vim.opt.lazyredraw = true -- Zeige alle Redraws (wichtig für smooth!)
vim.opt.ttyfast = true -- Schnelleres Terminal
vim.opt.regexpengine = 0 -- Automatische Engine-Wahl

-- Cursor-Updates schneller
vim.opt.updatetime = 100 -- Von 250ms auf 100ms (für smoothere cursor updates)

-- Dashboard
vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#61afef' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#98c379' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#7c7c7c', italic = true })

vim.opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus' -- Sync with system clipboard

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

opt.autowrite = true -- Enable auto write
opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus' -- Sync with system clipboard
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
opt.foldlevel = 99
opt.foldmethod = 'indent'
opt.foldtext = ''
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.jumpoptions = 'view'
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = true -- Disable the default ruler
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.smartindent = true -- Insert indents automatically
opt.smoothscroll = true
opt.spelllang = { 'en' }
opt.splitkeep = 'screen'
opt.tabstop = 2 -- Number of spaces tabs count for
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
