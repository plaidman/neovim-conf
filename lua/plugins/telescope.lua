return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",
		keys = {
			"<leader>ft",
			"<c-p>",
			"<leader>fg",
			"<leader>fb",
			"<leader>u",
			"<leader>fh",
			"<leader>fr",
			'<leader>*',
			"<leader>fn",
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"debugloop/telescope-undo.nvim",
		},

		config = function()
			require("telescope").setup({
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					undo = {
						use_delta = false,
						layout_config = {
							preview_width = 0.7,
						},
					},
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("undo")

			local builtin = require("telescope.builtin")

			-- tip: grep something,
			--   ctrl-q to put all entries in the quick fix,
			--   then :cfdo %s/find/replace/g to find and replace all the things

			vim.keymap.set("n", "<leader>ft", builtin.find_files)
			vim.keymap.set("n", "<c-p>", builtin.find_files)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep)
			vim.keymap.set("n", "<leader>fb", builtin.buffers)
			vim.keymap.set("n", "<leader>u", require("telescope").extensions.undo.undo)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags)
			vim.keymap.set("n", "<leader>fr", builtin.registers)
			vim.keymap.set('n', "<leader>*", builtin.grep_string)
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end)

			-- TODO: explore extensions
			-- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
			-- https://github.com/HUAHUAI23/telescope-session.nvim
			-- https://github.com/nvim-telescope/telescope-media-files.nvim
			-- https://github.com/doctorfree/cheatsheet.nvim
			-- https://github.com/arjunmahishi/flow.nvim
			-- https://github.com/jonarrien/telescope-cmdline.nvim
		end,
	},
}
