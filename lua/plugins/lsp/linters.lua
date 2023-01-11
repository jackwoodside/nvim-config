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
		settings.fmt_on_save(client, bufnr)
		settings.mappings(bufnr)
	end,
})

require("mason-null-ls").setup_handlers()
