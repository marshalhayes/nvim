return {
	"rcarriga/nvim-dap-ui",

	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},

	config = function()
		local dap = require("dap")

		-- Toggle breakpoint
		vim.keymap.set("n", "<leader>B", dap.toggle_breakpoint, { desc = "DAP: Toggle [B]reakpoint" })

		-- Start/stop debugging
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Start debugging" })

		-- Debugger navigation
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step into" })
		vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "DAP: Step out" })

		local dapui = require("dapui")

		-- Setup virtual text
		require("nvim-dap-virtual-text").setup({})

		-- Setup DAP UI
		dapui.setup()

		-- Setup listeners so that DAP UI opens & closes when debugging starts & stops
		dap.listeners.before.attach.dapui_config = function()
			-- Close neotree
			vim.cmd("Neotree close")

			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			-- Close neotree
			vim.cmd("Neotree close")

			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			vim.cmd("Neotree show")

			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			-- You may want to uncomment this, but I find it annoying that the UI closes when the debugger exits
			-- dapui.close()
		end
	end,
}
