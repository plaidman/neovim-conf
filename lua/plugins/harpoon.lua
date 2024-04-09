return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		---@diagnostic disable-next-line: missing-parameter
		harpoon.setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "[H]arpoon [A]dd" })

		vim.keymap.set("n", "<leader>fh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[F]ind [H]arpoon" })

		vim.keymap.set("n", "<leader>hl", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[H]arpoon [L]ist" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "[1]st Harpoon Buffer" })

		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "[2]nd Harpoon Buffer" })

		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "[3]rd Harpoon Buffer" })

		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "[4]th Harpoon Buffer" })
	end,
}
