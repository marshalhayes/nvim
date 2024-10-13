-- This file is used to configure the horizon theme and the nvim-treesitter plugin
return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])

			-- Tell vim this a dark background
			vim.o.background = "dark"

			-- Tell vim to use a transparent background
			vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])

			-- Tell vim to use a transparent background on float windows
			vim.cmd([[highlight NormalFloat guibg=NONE ctermbg=NONE]])
		end,
	},
}
