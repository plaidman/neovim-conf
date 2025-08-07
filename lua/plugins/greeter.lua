return {
	{
		"echasnovski/mini.starter",
		config = function()
			local starter = require("mini.starter")
			starter.setup({
				header = [[
					  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
					  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
					  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
					  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
					  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
					  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
				]],
				items = {
					starter.sections.sessions(6, true),
					starter.sections.recent_files(6, false),
					{ name = "New File", action = "enew", section = "Neovim Actions" },
					{ name = "CWD Files", action = "Telescope find_files", section = "Neovim Actions" },
					{
						name = "Config Files",
						action = 'Telescope find_files cwd=~/.config/nvim',
						section = "Neovim Actions",
					},
					{ name = "Plugin Update", action = "Lazy update", section = "Neovim Actions" },
					{ name = "Quit", action = "qa", section = "Neovim Actions" },
				},
			})
		end,
	},

	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			local sessions = require("mini.sessions")
			local directory = vim.fn.stdpath("data") .. "/session"

			sessions.setup({
				directory = directory,
				file = "",
			})

			vim.keymap.set("n", "<leader>fs", function()
				vim.cmd("Lazy load telescope.nvim")
				sessions.select()
			end, { desc = "[F]ind [S]ession" })

			vim.api.nvim_create_user_command("SessionFolder", "e " .. directory, {})

			vim.api.nvim_create_user_command("SessionCreate", function(args)
				sessions.write(args.fargs[1], { force = false })
			end, { nargs = 1 })

			vim.api.nvim_create_user_command("SessionDelete", function(args)
				sessions.select("delete", { force = args.bang })
			end, { bang = true })
		end,
	},
}
