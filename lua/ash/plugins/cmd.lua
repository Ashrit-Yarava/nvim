return {
	"smolck/command-completion.nvim",
	config = function()
		require("command-completion").setup({
			border = "rounded",
		})
	end,
}
