return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls_ok, null_ls = pcall(require, "null-ls")
		if not null_ls_ok then
			vim.notify("none-ls failed to load", vim.log.levels.ERROR)
			return
		end

		local ok, eslint = pcall(require, "none-ls.diagnostics.eslint")
		if not ok then
			vim.notify("none-ls-extras.nvim not installed, skipping eslint", vim.log.levels.WARN)
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.pylint,
				ok and eslint or nil,
			},

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<leader>f",
						"<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
						{ noremap = true, silent = true }
					)
				end
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
}
