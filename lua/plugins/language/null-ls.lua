local nls = require("null-ls")
local settings = require("plugins.language.settings")

-- Tools
require("mason-null-ls").setup({
	ensure_installed = {
		-- "clang-format",
		"latexindent",
		"shellcheck",
		"shfmt",
		"stylua",
	},
	handlers = {},
})

-- Latex sentence splitting
local latex_writing = {
	method = nls.methods.DIAGNOSTICS,
	filetypes = { "plaintex", "tex" },
	generator = {
		fn = function(params)
			local diagnostics = {}

			-- Line splitting
			for i, line in ipairs(params.content) do
				local col, end_col = line:find(".+%. .+%.")
				if col and end_col then
					table.insert(diagnostics, {
						row = i,
						col = col,
						end_col = end_col + 1,
						source = "latex_writing",
						message = "Split sentences across lines.",
						severity = vim.diagnostic.severity.HINT,
					})
				end
			end
			return diagnostics
		end,
	},
}
nls.register(latex_writing)

-- Nix formatting
nls.setup({ sources = { nls.builtins.formatting.nixfmt } })

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
