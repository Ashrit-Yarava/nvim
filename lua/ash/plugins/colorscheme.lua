return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup {
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                term_colors = true,
                transparent_background = true,
                no_italic = false,
                no_bold = false,
                styles = {
                    comments = {},
                    conditionals = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                },
            }

            vim.cmd("colorscheme catppuccin-mocha")
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
    }

}
