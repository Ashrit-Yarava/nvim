return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional
			{ "ray-x/lsp_signature.nvim" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required

			-- Null-LS
			{
				"jose-elias-alvarez/null-ls.nvim",
				"jay-babu/mason-null-ls.nvim",
			},

			-- Lsp Improvements
			{
				"glepnir/lspsaga.nvim",
				event = "BufRead",
				config = function()
					require("lspsaga").setup({
						ui = {
							border = "rounded",
						},
						symbol_in_winbar = {
							enable = true,
							separator = "  ",
							ignore_patterns = {},
							hide_keyword = true,
							show_file = true,
							folder_level = 2,
							respect_root = false,
							color_mode = true,
						},
					})
				end,
				dependencies = {
					{ "nvim-tree/nvim-web-devicons" },
					--Please make sure you install markdown and markdown_inline parser
					{ "nvim-treesitter/nvim-treesitter" },
				},
			},
			{ "onsails/lspkind.nvim" },
		},
		config = require("ash.config.lsp").setup,
	},

	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		config = function()
			require("trouble").setup({
				mode = "workspace_diagnostics",
				use_diagnostic_signs = true,
			})
		end,
	},
}
