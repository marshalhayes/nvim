return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		cmdline = {
			prompt = "> ",
		},

		popup = {
			relative = "editor",

			position = {
				row = "95%",
				col = "50%",
			},

			size = "25%",

			border = {
				style = "rounded",
				text = {
					top = "Enter a Command",
					top_align = "center",
				},
			},
		},
	},
	keys = function()
		return {
			{ ":", "<cmd>FineCmdline<CR>" },
		}
	end,
}
