--[[ TODO: startup screen
	project list
	new file
	config
	quit
	update lazy
	update mason

	need to be able to separate into groups

	goolord/alpha-nvim
	nvimdev/dashboard-nvim
	echasnovski/mini.starter
--]]

return {
	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			local sessions = require("mini.sessions")
			local directory = vim.fn.stdpath('data') .. '/session'

			sessions.setup({
				directory = directory,
				file = '',
			})

			vim.keymap.set("n", "<leader>sl", function() sessions.select() end)
			vim.api.nvim_create_user_command("SessionFolder", "e " .. directory, {})

			vim.api.nvim_create_user_command("SessionCreate", function(args)
				sessions.write(args.fargs[1], { force = false })
			end, { nargs = 1 })

			vim.api.nvim_create_user_command("SessionDelete", function(args)
				sessions.select("delete", { force = args.bang })
			end, { bang = true })
		end,
	},

	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	--
	-- 	config = function()
	-- 		require("dashboard").setup({})
	-- 	end,
	-- },
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("alpha").setup(require("alpha.themes.theta").config)
	-- 	end,
	-- },
	-- {
	-- 	'echasnovski/mini.starter',
	-- 	version = false,
	-- 	config = function()
	-- 		require("mini.starter").setup()
	-- 	end
	-- },
}
