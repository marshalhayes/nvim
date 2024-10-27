-- The bufferline plugin is used to display the list of buffers as tabs at the top of the window
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
			"<leader><leader>",
			":BufferLinePick<CR>",
			{ noremap = true, silent = true, desc = "Change tabs" }
		)
	end,
}
