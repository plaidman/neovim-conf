return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("oil").setup({
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<leader>v"] = "actions.select_vsplit",
					["<leader>s"] = "actions.select_split",
					["<leader>p"] = "actions.preview",
					["<leader>q"] = "actions.close",
					["<leader>r"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["<leader>."] = "actions.toggle_hidden",
				},
				use_default_keymaps = false,
			})

	 		vim.keymap.set("n", "<leader>fe", "<cmd>Oil .<cr>")
	 		vim.keymap.set("n", "<leader>fE", "<cmd>Oil %:h<cr>")
		end,
	},
}
