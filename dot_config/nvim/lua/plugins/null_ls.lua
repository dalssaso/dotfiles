return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("null-ls").setup()
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
