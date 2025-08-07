return {
	{ "echasnovski/mini.ai", opts = {} },
	{ "echasnovski/mini.notify", opts = {} },
	{ "kylechui/nvim-surround", opts = {} },

	{
		"echasnovski/mini.bufremove",
		config = function()
			require("mini.bufremove").setup()

			vim.keymap.set("n", "<leader>q", function()
				if string.sub(vim.bo.filetype, 1, 6) == "Neogit" then
					print("Use 'q' to quit neogit")
					return
				end

				require("mini.bufremove").delete()
			end, { desc = "[Q]uit buffer" })
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({ direction = "float" })
			vim.keymap.set({ "n", "t" }, "<c-t>", "<cmd>ToggleTerm<cr>")
		end,
	},

	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup({})

			vim.keymap.set("x", "<leader>/", function()
				return MiniComment.operator()
			end, { expr = true, desc = "Comment Selection" })

			vim.keymap.set("n", "<leader>/", function()
				return MiniComment.operator() .. "_"
			end, { expr = true, desc = "Comment Line" })
		end,
	},

	{
		"echasnovski/mini.move",
		version = false,
		opts = {
			mappings = {
				-- visual mode
				left = "<c-left>",
				right = "<c-right>",
				down = "<c-down>",
				up = "<c-up>",

				-- normal mode
				line_left = "<c-left>",
				line_right = "<c-right>",
				line_down = "<c-down>",
				line_up = "<c-up>",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
