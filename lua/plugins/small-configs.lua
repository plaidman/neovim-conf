return {
	{ "echasnovski/mini.ai", opts = {} },
	{ "echasnovski/mini.notify", opts = {} },
	{ "kylechui/nvim-surround", opts = {} },

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({})
		end,
	},

	{
		"echasnovski/mini.cursorword",
		config = function()
			require("mini.cursorword").setup()

			vim.cmd("highlight MiniCursorword gui=underline")
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({ direction = "float" })
			vim.keymap.set({ "n", "t" }, "<c-t>", "<cmd>ToggleTerm<cr>")

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

			vim.keymap.set("n", "<leader>g", function()
				lazygit:toggle()
			end)
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
			vim.keymap.set("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
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
