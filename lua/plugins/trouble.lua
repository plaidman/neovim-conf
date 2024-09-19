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

		local nav_trouble = function(direction)
			if require("trouble").is_open() then
				require("trouble")[direction]({ skip_groups = true, jump = true })
			else
				require("trouble").open("diagnostics")
				require("trouble").first({ skip_groups = true, jump = true })
			end
		end

		vim.keymap.set("n", "]d", function()
			nav_trouble('next')
		end, { desc = "Next [D]iagnostic" })

		vim.keymap.set("n", "[d", function()
			nav_trouble('prev')
		end, { desc = "Prev [D]iagnostic" })
	end,
}
