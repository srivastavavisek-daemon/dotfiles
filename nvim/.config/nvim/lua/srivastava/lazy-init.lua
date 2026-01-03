-------[ Bootstrap lazy.nvim ]-------------------------------------------------
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",  -- latest stable release 
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)  -- prepend lazy.nvim to rtp

require("lazy").setup({
	defaults = { lazy = true },  -- “safe global lazy” policy
	spec = {
        { import = "srivastava.plugins" },
    },
	change_detection = { notify = false },
})
-- Lazy’s "import" mechanism is smarter. It recursively loads every Lua file 
-- inside that directory and expects each file to return a plugin spec.
--
-- By-default all the plugins inside the srivastava.plugins directory 
-- will be loaded lazily. 
-- Instead you can load plugins during Neovim’s initialization by slapping
-- `lazy = false` onto a plugin inside that directory
--
