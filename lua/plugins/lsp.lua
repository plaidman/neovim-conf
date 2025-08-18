-- see https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview

-- also see https://github.com/neovim/nvim-lspconfig for more information about enabling new LSPs
-- there should be some instructions in the lsp directory to install each server
return {
	"neovim/nvim-lspconfig",
	dependencies = { "artemave/workspace-diagnostics.nvim" },
	config = function()
		vim.lsp.enable('lua_ls')
		vim.lsp.enable('roslyn_ls')

		vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over" })
		vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "[C]ode re[N]ame" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

		-- error/warning messages
		vim.diagnostic.config({
			-- Use the default configuration
			-- virtual_lines = true

			-- Alternatively, customize specific options
			virtual_lines = {
				-- Only show virtual line diagnostics for the current cursor line
				current_line = true,
			},
		})

		-- setup roslyn ls location
		vim.lsp.config('roslyn_ls', {
            on_attach = function(client, bufnr)
                require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
            end,
			cmd = {
				'/Users/jtomsic/.config/nvim/lsp/roslyn-ls/Microsoft.CodeAnalysis.LanguageServer',
				'--logLevel',
				'Information',
				'--extensionLogDirectory',
				vim.fs.joinpath(vim.uv.os_tmpdir(), 'roslyn_ls/logs'),
				'--stdio',
			},
		})

		-- config to add vim autocomplete and runtime
		vim.lsp.config('lua_ls', {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath('config')
						and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							'lua/?.lua',
							'lua/?/init.lua',
						},
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							'${3rd}/luv/library',
							'${3rd}/busted/library',
						}
					}
				})
			end,
			settings = {
				Lua = {}
			}
		})
	end,
}

