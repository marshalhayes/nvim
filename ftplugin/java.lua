local jdtls = require("jdtls")
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local bundle_root = vim.fn.stdpath("data")

local bundles = {
	-- Load the java-debug extension
	bundle_root .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar",
}

-- Load the vscode-java-test extension
vim.list_extend(bundles, vim.split(vim.fn.glob(bundle_root .. "/vscode-java-test/server/*.jar"), "\n"))

local config = {
	cmd = {
		"jdtls",
		"--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$MASON/packages/jdtls/lombok.jar")),
	},

	root_dir = root_dir,

	settings = {
		java = {
			-- Download sources
			eclipse = {
				downloadSources = true,
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
		},
	},

	init_options = {
		bundles = bundles,
	},
}

jdtls.start_or_attach(config)
