return {
	-- TODO: use the mini.files repo directly?

	-- alternatives:
	-- https://github.com/nvim-telescope/telescope-file-browser.nvim
	-- oil.nvim
	-- neotree
	-- nvimtree

	"echasnovski/mini.files",
	version = false,
	config = function()
		require("mini.files").setup()

		-- TODO: keybinds
		-- <leader>fe - toggle explorer
		-- ,cd - change directory
		-- ,. - show/hide dot files
		-- <shift-right> - go in (but not open file)
		-- <shift-left> - go out
		-- <shift-enter> - open file or change dir
		-- <enter> - do nothing
		--
		-- https://github.com/echasnovski/mini.nvim/blob/main/doc/mini-files.txt
		-- show/hide dot files
		-- toggle explorer
		-- change current working directory

		vim.keymap.set("n", "<leader>fe", MiniFiles.open)
	end
}

