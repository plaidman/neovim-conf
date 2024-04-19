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
		"sindrets/diffview.nvim",
		lazy = true,
		config = function()
			require("diffview").setup({
				view = {
					merge_tool = {
						layout = "diff3_mixed",
					},
				},
			})
		end,
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
			"akinsho/toggleterm.nvim",
		},
		cmd = "Git",
		config = function()
			-- TODO: learn how to resolve merge conflicts
			require("neogit").setup({})

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

			vim.api.nvim_create_user_command("Git", function(args)
				if args.fargs[1] == "lazy" then
					lazygit:toggle()
				else
					require("neogit").open({ args.fargs[1] })
				end
			end, { nargs = "?" })
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
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = false,
			current_line_blame_opts = {
				delay = 500,
			},
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
			vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment Line" })
			vim.keymap.set("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment Lines" })
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
