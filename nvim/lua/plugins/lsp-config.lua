return {
	-- Mason core
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP installer
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright" },
			})
		end,
	},

	-- LSP setup using new Neovim 0.11 API
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Configure servers
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			vim.lsp.config("ts_ls", {})
			vim.lsp.config("sourcekit", {
				cmd = { "/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp" },
				filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
			})

			-- Enable servers
			vim.lsp.enable({ "lua_ls", "ts_ls", "pyright", "sourcekit" })

			-- Keymaps using LspAttach auto-command
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buf = args.buf
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf })
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf })

					-- Show LSP error under cursor
					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = buf })
				end,
			})
		end,
	},
}
