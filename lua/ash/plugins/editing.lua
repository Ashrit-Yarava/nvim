return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {

        },
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("nvim-treesitter.configs").setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = "all",

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                -- List of parsers to ignore installing (for "all")
                ignore_install = { "haskell" },

                highlight = {
                    enable = true,
                    disable = { "c", "rust" },
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    },

    {
        "RRethy/vim-illuminate",
        lazy = false
    },

     {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end
     }
}
