return {
	{
		"sindrets/diffview.nvim",
		lazy = true,
		config = function()
			require("diffview").setup({
				view = {
					merge_tool = {
						layout = "diff3_mixed"
					}
				}
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
			-- NOTE: use :DiffviewOpen to resolve merge conflicts
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
}
