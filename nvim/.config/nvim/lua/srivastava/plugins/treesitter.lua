return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,

        -- Lazy.nvim executes this function after the plugin is loaded
        config = function() 
            require('nvim-treesitter.configs').setup({
                --
                -- installs these parsers when you run :TSUpdate or :TSInstall.
                ensure_installed = { 
                    "c", 
                    "lua", 
                    "vim", 
                    "vimdoc", 
                    "query", 
                    --"markdown", 
                    --"markdown_inline", 
                    "python", 
                    "regex", 
                    "typescript", 
                    "rust", 
                    --"bash", 
                    "css", 
                    "cpp", 
                    "go", 
                    "html", 
                    "java", 
                    "javascript", 
                    --"json" 
                },

                -- Parsers are installed asynchronously in the background
                --sync_install = false  -- (default)

                -- Automatically installs missing parsers on the fly 
                -- when entering buffer - you open a file of that language.
                --auto_install = true,
                --ignore_install = { "javascript" },

                highlight = {
                    enable = true,

                    -- Neovim has its old built-in syntax highlighting system, 
                    -- which is based on regex patterns (:syntax rules).
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Recommended to use only Treesitter highlighting
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>ss",
                        node_incremental = "<leader>si",
                        scope_incremental = "<leader>sc",
                        node_decremental = "<leader>sd",
                    },
                },
            })
        end,
    },
}
