return {
	{
		"rcarriga/nvim-dap-ui",

		keys = {
			{ "<leader>db", desc = "[D]ebugger [B]reakpoint" },
			{ "<leader>ds", desc = "[D]ebugger [S]tart" },
		},

		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"NicholasMata/nvim-dap-cs",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			require("dap-cs").setup({
				netcoredbg = { path = vim.fn.stdpath("config") .. "/netcoredbg-macos/netcoredbg" }
			})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end

			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebugger [B]reakpoint" })
			vim.keymap.set("n", "<Leader>ds", dap.continue, { desc = "[D]ebugger [S]tart" })
		end,
	},
}
