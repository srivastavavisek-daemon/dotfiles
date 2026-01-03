local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function nmap(lhs, rhs, desc)
    map("n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

local function vmap(lhs, rhs, desc)
    map("v", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

local function xmap(lhs, rhs, desc)
    map("x", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end
-- vim.tbl_extend is a Neovim Lua function for merging two or more tables
-- "force" → values in later tables overwrite values from earlier tables if there’s a conflict.
-- In our case, there isn't
-- still we are gonna keep this to futureproof these helpers

nmap("<leader>w", ":w<CR>", "Save File")
nmap("<leader>q", ":q<CR>", "Quit File")

vmap("J", ":m '>+1<CR>gv=gv", "Move Selected Lines Up")
vmap("K", ":m '<-2<CR>gv=gv", "Move Selected Lines Down")

nmap("<C-d>", "<C-d>zz", "Scroll Down keeping cursor centered")
nmap("<C-u>", "<C-u>zz", "Scroll Up keeping cursor centered")
nmap("n", "nzzzv", "keep search results centered")
nmap("N", "Nzzzv", "keep search results centered")

xmap("<leader>p", "\"_dP", "Paste over selection without overwriting clipboard")

map("n", "<leader>ee", vim.cmd.Ex, opts) 

--
-- Telescope
local builtin = require('telescope.builtin')
nmap('<leader>ff', builtin.find_files, 'Telescope find files')
nmap("<leader>fg", builtin.live_grep,  "Live grep")
nmap("<leader>fb", builtin.buffers,    "Find buffers")
nmap("<leader>fr", builtin.oldfiles,   "Recent files")
nmap("<leader>fd", builtin.diagnostics, "Diagnostics")

--
-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>a", mark.add_file, opts)
map("n", "<C-e>", ui.toggle_quick_menu, opts)

map("n", "<C-1>", function() ui.nav_file(1) end, opts)
map("n", "<C-2>", function() ui.nav_file(2) end, opts)
map("n", "<C-3>", function() ui.nav_file(3) end, opts)
