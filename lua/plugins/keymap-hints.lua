--[[ TODO: leader combo hints

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

	telescope: ,f (for find)
		file names: ,ff
		grep in files: ,fg
		list buffers: ,fb
		list config files: ,fn

	oil: :Oil
		explore cwd: :OilCwd
		explore current file's folder: :OilFileDir

	session: :Session
		create new session :SessionCreate
		delete session: :SessionDelete
		open session folder: :SessionFolder
		session list: ,fs

	window navigation: ,w (for window)
		split: ,ws
		v-split: ,wv
		close: ,wq
		next window: ,ww

	yank, paste system clipboard
		yank: ,y
		paste: ,p

	harpoon: ,h
		add to list: ,ha
		show list: ,hl or ,fh
	buffer switch: ,1 ,2 ,3 ,4

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

--]]

return {
}
