return {
	-- TODO: more mini stuff
	-- bracketed
	-- bufremove
	-- clue
	-- completion
	-- files
	-- operators
	-- sessions
	-- starter

	{ "echasnovski/mini.ai", opts = {} },
	{ "echasnovski/mini.cursorword", opts = {} },
	{ "echasnovski/mini.notify", opts = {} },
	{ "kylechui/nvim-surround", opts = {} },
	{ "tpope/vim-fugitive" },

	{
		"lewis6991/gitsigns.nvim",
		opts = {
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
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})

			-- hide mode line when lualine is loaded
			vim.opt.showmode = false
		end,
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
