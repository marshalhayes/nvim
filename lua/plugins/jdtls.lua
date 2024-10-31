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
	end,
}
