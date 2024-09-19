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


vim.api.nvim_create_user_command("Spaces", function(args)
	if not args.fargs[1] then
		args.fargs[1] = 4
	end

	vim.opt.tabstop = tonumber(args.fargs[1]) -- set tabstop width
	vim.opt.shiftwidth = tonumber(args.fargs[1]) -- auto indent width
	vim.opt.softtabstop = tonumber(args.fargs[1]) -- number of spaces <tab> key counts as
	vim.opt.expandtab = true  -- convert <tab> keypresses to spaces
end, { nargs = "?" })

vim.api.nvim_create_user_command("Tabs", function(args)
	if not args.fargs[1] then
		args.fargs[1] = 4
	end

	vim.opt.tabstop = tonumber(args.fargs[1]) -- set tabstop width
	vim.opt.shiftwidth = tonumber(args.fargs[1]) -- auto indent width
	vim.opt.softtabstop = tonumber(args.fargs[1]) -- number of spaces <tab> key counts as
	vim.opt.expandtab = false  -- convert <tab> keypresses to spaces
end, { nargs = "?" })
