-- Sets the colorscheme to my favorite, which is GitHub's Dark Tritanopia theme
return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("github-theme").setup({})

		vim.cmd("colorscheme github_dark_tritanopia")
	end,
}
