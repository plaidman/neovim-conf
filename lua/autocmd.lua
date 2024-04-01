local augroup = vim.api.nvim_create_augroup("plaidman", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- highlight when yanking text
autocmd("TextYankPost", {
	desc = "After yanking, highlight yanked range.",
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- clear trailing white space
autocmd("BufWritePre", {
	desc = "Before save, clear trailing whitespace.",
	group = augroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- autocmd("CursorHold", {
-- 	desc = "hover when stopping moving the cursor",
-- 	group = augroup,
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.lsp.buf.hover()
-- 	end
-- })

vim.api.nvim_create_user_command("ColorToggle", function(args)
	local cur_color = vim.g.colors_name
	local color_table = {
		-- NOTE: you can add new items to the rotation.
		sonokai = "dayfox",
		dayfox = "sonokai",
	}
	local new_color = color_table[cur_color] or "dayfox"

	if args.fargs[1] == "dark" then
		new_color = "sonokai"
	elseif args.fargs[1] == "light" then
		new_color = "dayfox"
	end

	print(cur_color .. " -> " .. new_color)
	vim.cmd.colorscheme(new_color)
end, { nargs = "?" })

