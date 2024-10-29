-- LSP configuration
return {
	-- Lua LSP
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},

	{ "Bilal2453/luvit-meta", lazy = true },

	-- Main LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

				callback = function(event)
					-- Set up keymaps for LSP
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Go to definition
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Go to references
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Go to type definition
					map("gD", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Rename variable
					-- I'm using ctrl + r twice because I'm used to it from IntelliJ w/ Visual Studio keymaps
					map("<C-r><C-r>", vim.lsp.buf.rename, "[R]e[n]ame Variable")

					-- Execute a code action
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
				end,
			})

			require("mason").setup()

			local servers = {
				-- Lua LSP
				lua_ls = {},

				-- Markdown LSP
				marksman = {},

				-- Used for formatting lua code
				stylua = {},

				-- Angular and TypeScript
				ts_ls = {},
				angularls = {},

				-- Java
				jdtls = {
					cmd = {
						"jdtls",
						"--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$MASON/share/jdtls/lombok.jar")),
					},
				},
			}

			-- Install the servers automatically
			require("mason-tool-installer").setup({
				ensure_installed = vim.tbl_keys(servers),

				automatically_install = true,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name]

						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
