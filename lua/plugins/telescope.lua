return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			pickers = {
				colorscheme = {
					enable_preview = true
				}
			}
		})
		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ft", builtin.find_files, {})
		vim.keymap.set("n", "<c-p>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fr", builtin.registers, {})

		-- TODO: other keybinds
		-- telescope marks

		-- TODO: explore extensions
		-- https://github.com/dam9000/kickstart-modular.nvim/blob/master/lua/kickstart/plugins/telescope.lua
		-- https://github.com/nvim-telescope/telescope-ui-select.nvim
		-- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
		-- https://github.com/HUAHUAI23/telescope-session.nvim
		-- https://github.com/nvim-telescope/telescope-media-files.nvim
		-- https://github.com/doctorfree/cheatsheet.nvim
		-- https://github.com/arjunmahishi/flow.nvim
		-- https://github.com/nvim-telescope/telescope-file-browser.nvim
		-- https://github.com/jonarrien/telescope-cmdline.nvim
	end
}

