return {
	-- TODO: keybinds for
	--   enter folder
	--   back folder
	--   back previous to CWD
	--   cd
	--   hide and show dot files
	--   preview files
	--   open explorer in current file's directory
	--   open explorer in CWD

	{
		"stevearc/oil.nvim",
		-- https://github.com/stevearc/oil.nvim/blob/master/doc/oil.txt
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"echasnovski/mini.files",
		-- https://github.com/echasnovski/mini.files/blob/main/doc/mini-files.txt
		version = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("mini.files").setup()
			vim.keymap.set("n", "<leader>fe", MiniFiles.open)
		end,
	},
}
