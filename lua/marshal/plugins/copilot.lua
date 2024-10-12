-- This plugin configures GitHub Copilot for use within vim
-- It also sets some environment variables to allow network requests to work even when behind a corporate proxy
return {
	"github/copilot.vim",
	config = function()
		-- Tell copilot to not use strict ssl checking
		-- This is particularly useful when behind a corporate proxy
    -- vim.g.copilot_proxy_strict_ssl = false

		-- Copilot also seems to rely on nodejs
		-- This flag tells node to also not use strict ssl checks, but
		-- only is used while within vim
    -- vim.env.NODE_TLS_REJECT_UNAUTHORIZED = 0
	end
}
