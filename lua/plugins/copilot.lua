-- The copilot plugin is a plugin that provides AI-assisted code completion and generation
return {
	"github/copilot.vim",
	config = function()
		-- When using a corporate proxy, you may need to uncomments these lines
		-- vim.g.copilot_proxy_strict_ssl = false
		-- vim.env.NODE_TLS_RJECT_UNAUTHORIZED = 0
	end,
}
