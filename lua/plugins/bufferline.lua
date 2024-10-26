return {
	"akinsho/bufferline.nvim",
	version = "v4.*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",

			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},

			indicator = {
				style = "underline",
			},
		},
	},
	init = function()
		vim.api.nvim_set_keymap(
			"n",
			"<C-t>",
			":BufferLinePick<CR>",
			{ noremap = true, silent = true, desc = "Change tabs" }
		)
	end,
}
