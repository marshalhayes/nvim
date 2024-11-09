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

		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [w]ord" })

		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [r]eferences" })

		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [k]eymaps" })

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [h]elp" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Find in current buffer" })

		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [n]vim files" })
	end,
}
