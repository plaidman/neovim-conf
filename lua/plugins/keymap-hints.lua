--[[

organize leader combos
	organize keymaps
	https://www.reddit.com/r/neovim/comments/18jcj0q/any_advice_on_general_keymapping_methodologies/

	colon commands - infrequently used
	leader commands - open a popup?
	g commands - travel somewhere in code?
	ctrl commands - other
	other - convenience keymaps

	tris203/hawtkeys.nvim
	echasnovski/mini.clue
	folke/which-key.nvim

	code actions: ,c (for code)
		show hover: ,ch
		list definition: ,cd
		list references: ,cr
		code action: ,ca
		rename symbol: ,cn (for reName)

	debugger: ,d (for debugger)
		toggle breakpoint: ,db
		start debugger: ,ds

	telescope: ,f (for find)
		file names: ,ff
		grep in files: ,fg
		list buffers: ,fb
		list config files: ,fn

	window navigation: ,w (for window)
		split: ,ws
		v-split: ,wv
		close: ,wq
		next window: ,ww

	tab navigation: ,t
		tab quit: ,tq
		tab new: ,tt
		tab next: ,tn
		tab prev: ,tp

	yank, paste system clipboard
		yank: ,y
		paste: ,p

	harpoon: ,h
		add to list: ,ha
		show list: ,hl or ,fh
	buffer switch: ,1 ,2 ,3 ,4

	oil: :Oil
		explore cwd: :OilCwd
		explore current file's folder: :OilFileDir

	session: :Session
		create new session :SessionCreate
		delete session: :SessionDelete
		open session folder: :SessionFolder
		session list: ,fs

	git: :Git
		show neogit: :Git
		show lazygit: :Git lazy

	close current buffer: ,q
	toggle comment: ,/
	formatter: ,=
	show undo list: ,u
	grep current hovered word ,*

	select all text: <c-a>
	toggle terminal: <c-t>

	forward/back diagnostics: [d ]d
	forward/back quickfix: [q ]q
	forward/back tab: [t ]t

--]]

return {
	{
		"echasnovski/mini.clue",
		version = false,
		config = function()
			local miniclue = require("mini.clue")

			miniclue.setup({
				window = {
					config = {
						width = "auto",
					},
				},

				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },

					-- special navigation
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "]" },
				},

				clues = {
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows({
						submode_move = true,
						submode_navigate = true,
						submode_resize = true,
					}),
					miniclue.gen_clues.z(),

					{ mode = "n", keys = "<leader>c", desc = "+LSP [C]ode" },
					{ mode = "n", keys = "<leader>d", desc = "+[D]ebugger" },
					{ mode = "n", keys = "<leader>w", desc = "+[W]indow" },
					{ mode = "n", keys = "<leader>t", desc = "+[T]ab" },
					{ mode = "n", keys = "<leader>f", desc = "+[F]ind" },
					{ mode = "n", keys = "<leader>h", desc = "+[H]arpoon" },
					{ mode = "n", keys = "[", desc = "+Prev Item" },
					{ mode = "n", keys = "]", desc = "+Next Item" },
				},
			})
		end,
	},
}
