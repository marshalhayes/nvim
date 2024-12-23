-- The treesitter plugin is a plugin that provides syntax highlighting and indentation for a virtually all modern languages
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "diff", "html", "lua", "luadoc", "vim", "vimdoc" },

		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
	},
}
