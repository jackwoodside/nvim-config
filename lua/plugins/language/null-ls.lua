local nls = require("null-ls")
local settings = require("plugins.language.settings")

-- Tools
require("mason-null-ls").setup({
	ensure_installed = {
		"black",
		"clang-format",
		"latexindent",
		"shellcheck",
		"shfmt",
		"stylua",
	},
	automatic_setup = true,
})

-- Settings
nls.setup({
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
