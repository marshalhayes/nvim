return {
	"mfussenegger/nvim-jdtls",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-dap",
	},

	config = function()
		-- Ensure JDTLS is installed
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = { "jdtls" },
			automatic_installation = true,
		})

		local jdtls = require("jdtls")

		vim.keymap.set("n", "<leader>tc", jdtls.test_class, { desc = "DAP: [T]est [c]lass" })
		vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { desc = "DAP: [T]est [m]ethod" })
	end,
}
