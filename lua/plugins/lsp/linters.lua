local settings = require("plugins.lsp.settings")

-- Linters
require("mason-null-ls").setup({
	ensure_installed = {
		"autopep8",
		--"cpplint",
		"shellcheck",
		"shfmt",
		"stylua",
	},
	automatic_setup = true,
})

-- Settings
require("null-ls").setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = settings.augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = settings.augroup,
				buffer = bufnr,
				callback = function()
					settings.formatting(bufnr)
				end,
			})
		end
		settings.mappings(bufnr)
	end,
})

require("mason-null-ls").setup_handlers()
