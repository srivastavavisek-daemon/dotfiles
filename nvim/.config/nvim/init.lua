-- [ srivastavavisek's neovim config ]
--

require("srivastava.set")  -- options
require("srivastava.lazy-init")
require("srivastava.remap")

-- TODO: remove this later
vim.lsp.start({
    name = 'lsp-server-clangd',
    cmd = {'/home/srivastava/clangd/clangd_21.1.0/bin/clangd'},
    root_dir = vim.fn.getcwd(),
})
