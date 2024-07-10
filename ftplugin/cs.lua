vim.keymap.set("n", "<leader>cd", function ()
	require('omnisharp_extended').telescope_lsp_definition()
end, { desc = "[C]ode [D]efinitions" })

vim.keymap.set("n", "<leader>cr", function ()
	require('omnisharp_extended').telescope_lsp_references()
end, { desc = "[C]ode [R]eferences" })

vim.keymap.set("n", "<leader>ci", function ()
	require('omnisharp_extended').telescope_lsp_implementation()
end, { desc = "[C]ode [I]mplementations" })
