return {
	{
		"echasnovski/mini.files",
		version = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("mini.files").setup({
				mappings = {
					close = "q",
					go_in = "<s-enter>",
					go_in_plus = "<enter>",
					go_out = "",
					go_out_plus = "-",
					reset = "",
					reveal_cwd = "_",
					show_help = "g?",
					synchronize = "=",
					trim_left = "<",
					trim_right = ">",
				},
				windows = {
					preview = true,
					width_preview = 80,
				},
			})

			local show_dotfiles = true

			local filter_show = function()
				return true
			end

			local filter_hide = function(fs_entry)
				return not vim.startswith(fs_entry.name, ".")
			end

			local toggle_dotfiles = function()
				show_dotfiles = not show_dotfiles
				local new_filter = show_dotfiles and filter_show or filter_hide
				MiniFiles.refresh({ content = { filter = new_filter } })
			end

			local go_in_folder_only = function()
				local type = MiniFiles.get_fs_entry().fs_type
				if type == "file" then return end

				MiniFiles.go_in({})
			end

			local open_mini_files_curfile = function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
			end

			local open_mini_files_cwd = function()
				MiniFiles.open(nil, false)
			end

			local change_dir = function()
				local cur_entry_path = MiniFiles.get_fs_entry().path
				local cur_directory = vim.fs.dirname(cur_entry_path)
				print("changed to " .. cur_directory)
				-- cd for all windows, because Neogit tends to set lcd for the current window
				vim.cmd.windo("cd " .. cur_directory)
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					vim.keymap.set("n", "<s-right>", go_in_folder_only, { buffer = args.data.buf_id })
					vim.keymap.set("n", "<s-left>", MiniFiles.go_out, { buffer = args.data.buf_id })
					vim.keymap.set("n", "`", change_dir, { buffer = args.data.buf_id })
					vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = args.data.buf_id })
				end,
			})

			vim.keymap.set("n", "<leader>fe", open_mini_files_cwd, { desc = "[F]ile [E]xplorer (cwd)" })
			vim.keymap.set("n", "-", open_mini_files_curfile, { desc = "[F]ile [E]xplorer (filepath)" })
		end,
	},
}