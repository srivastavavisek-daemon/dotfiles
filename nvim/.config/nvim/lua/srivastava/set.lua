-- LazyVim itself defines a default set of options in its own repo.
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- option you define in this file will override the defaults

local o = vim.opt

-------[ LINE NUMBERS AND SCROLLING ]------------------------------------------
o.number = true
o.relativenumber = true
o.cursorline = true  -- highlight the current line for context
o.scrolloff	= 8	-- 999 for cursor-centered mode
-- Keeps 8 lines visible above and below cursor when scrolling.

-------[ INDENTATION ]---------------------------------------------------------
o.tabstop = 4     -- a tab character equates to 4 spaces
o.shiftwidth = 4     -- use 4 spaces indent/outdent when << or >> or ==
o.expandtab = true	-- convert tabs into spaces
o.smartindent = true	-- for C-like languages
--o.softtabstop = 4   -- Softtabstop can match shiftwidth automatically

-------[ INTERFACE ]-----------------------------------------------------------
o.laststatus = 3     -- single global status line
o.signcolumn = "yes"  -- Left gutter shows diagnostic signs
o.termguicolors = true  -- enable 24-bit colors
-- o.ruler = false
o.colorcolumn = "80"  -- vertical guideline
o.title = true
o.guicursor = "n-v-c:block,i-ci-ve:ver25-blinkon1,r-cr:hor20-blinkon1,o:hor50-blinkon1"
-- n-v-c = normal - visual - commandLine
-- i-ci-ve = insert - insertCompletion - visualExclusive
-- r-cr = replaceMode - replaceCommandLine
-- o = operatorPendingMode

o.splitkeep = 'screen'  -- stabilizes window open/close
vim.opt.splitright = true
vim.opt.splitbelow = true

-------[ SEARCHING ]-----------------------------------------------------------
o.incsearch = true  -- show search matches as you type
o.hlsearch = false  -- false, unless you like neon text everywhere
vim.opt.ignorecase = true
vim.opt.smartcase = true

-------[ LINE WRAPING ]--------------------------------------------------------
o.wrap = false
-- enable soft wrap for markdown via plugin

-------[ BACKUPS ]-------------------------------------------------------------
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.nvim-undodir"
-- make sure the directory exists. neovim won't create it
o.history = 1000  -- Command-line history length

------[ OTHERS ]---------------------------------------------------------------
o.mouse = "a"   -- enable in "all" modes
o.clipboard	= "unnamedplus"
o.swapfile = false  -- crash recovery (almost nobody uses it nowadays)
o.backup = false  -- annoying
o.ttimeoutlen = 50    -- terminal timeout length
o.timeoutlen = 300   -- reducing mapping timeout
o.updatetime = 100
-- Fast enough to feel immediate, slow enough to be stable.
o.isfname:append("@-@")  -- Allows filenames(like: my-file@.js)

--vim.g.lazygit_config = false

-- local options = {}
-- for k, v in pairs(options) do
--    vim.opt[k] = v
-- end

vim.g.mapleader = ' '  -- global leader = Space
vim.g.maplocalleader = ' '

-- disable default behavior of space
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })
