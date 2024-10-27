-- The telescope plugin is a plugin that provides a modern interface for finding files, grepping, and more
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- Load fzf extension for telescope if it's available
		pcall(require("telescope").load_extension, "fzf")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [f]iles" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [g]rep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
	end,
}
