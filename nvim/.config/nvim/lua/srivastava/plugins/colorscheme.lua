return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",  -- latte, frappe, macchiato, mocha
                transparent_background = false,
                term_colors = true,
                
                --auto_integrations = false,
                integrations = {
                    telescope = true,
                    treesitter = true,
                    --gitsigns = true,
                    --cmp = true,
                    --native_lsp = { enabled = true, }
                    --mini = true,
                    --lsp_trouble = true,
                }
            })

            vim.cmd.colorscheme "catppuccin" 
        end,
    },
}
