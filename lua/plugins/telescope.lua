return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",

		keys = {
			{ "<leader>ft", desc = "[F]ind Files" },
			{ "<c-p>", desc = "Find Files" },
			{ "<leader>fg", desc = "[F]ind Text [G]rep" },
			{ "<leader>fb", desc = "[F]ind [B]uffers" },
			{ "<leader>fn", desc = "[F]ind [N]eovim Config" },
			{ "<leader>cd", desc = "[C]ode [D]efinitions" },
			{ "<leader>cr", desc = "[C]ode [R]eferences" },
			{ "<leader>u", desc = "[U]ndo Tree" },
			{ "<leader>*", desc = "Find Current Word" },
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			-- TODO "nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"debugloop/telescope-undo.nvim",
		},

		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<c-up>"] = actions.preview_scrolling_up,
							["<c-down>"] = actions.preview_scrolling_down,
						},
						i = {
							["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<c-up>"] = actions.preview_scrolling_up,
							["<c-down>"] = actions.preview_scrolling_down,
						},
					}
				},

				pickers = {
					colorscheme = {
						enable_preview = true,
					},

					buffers = {
						mappings = {
							n = {
								["<c-x>"] = actions.delete_buffer,
							},
							i = {
								["<c-x>"] = actions.delete_buffer,
							},
						},
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

			-- NOTE: tip: grep something,
			--   ctrl-q to put all entries in the quick fix,
			--   then :cfdo %s/find/replace/g to find and replace all the things

			vim.keymap.set("n", "<leader>ft", builtin.find_files, { desc = "[F]ind Files" })
			vim.keymap.set("n", "<c-p>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind Text [G]rep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[F]ind [N]eovim Config" })

			vim.keymap.set("n", "<leader>cd", builtin.lsp_definitions, { desc = "[C]ode [D]efinitions" })
			vim.keymap.set("n", "<leader>cr", builtin.lsp_references, { desc = "[C]ode [R]eferences" })
			vim.keymap.set("n", "<leader>ci", builtin.lsp_implementations, { desc = "[C]ode [I]mplementations" })

			vim.keymap.set("n", "<leader>u", require("telescope").extensions.undo.undo, { desc = "[U]ndo Tree" })
			vim.keymap.set("n", "<leader>*", builtin.grep_string, { desc = "Find Current Word" })
		end,
	},
}