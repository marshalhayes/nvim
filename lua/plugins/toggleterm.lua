-- The toggleterm plugin opens a terminal window within neovim
return {
	"akinsho/toggleterm.nvim",
	version = "v2.*",
	opts = {
		open_mapping = [[<C-t>]],
		direction = "float",
		float_opts = {
			border = "curved",
		},
	},
}
