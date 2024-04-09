return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{ "]d", desc = "Next [D]iagnostic" },
		{ "[d", desc = "Prev [D]iagnostic" },
	},
	config = function()
		require("trouble").setup({ auto_close = true })

		vim.keymap.set("n", "]d", function()
			if require("trouble").is_open() then
				require("trouble").next({ skip_groups = true, jump = true })
			else
				require("trouble").open("workspace_diagnostics")
				require("trouble").first({ skip_groups = true, jump = true })
			end
		end, { desc = "Next [D]iagnostic" })

		vim.keymap.set("n", "[d", function()
			if require("trouble").is_open() then
				require("trouble").previous({ skip_groups = true, jump = true })
			else
				require("trouble").open("workspace_diagnostics")
				require("trouble").first({ skip_groups = true, jump = true })
			end
		end, { desc = "Prev [D]iagnostic" })
	end,
}
