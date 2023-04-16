local settings = {}

-- Capabilities with nvim-cmp
function settings.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

-- Disable LSP formatting, only use null-ls
function settings.formatting(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- Format on save
settings.augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Keybinds
local function map(m, k, v, opts)
	vim.keymap.set(m, k, v, opts)
end

function settings.mappings(bufnr)
	local opts = { buffer = bufnr }
	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)
	map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gh", vim.lsp.buf.hover, opts)
	map("n", "<C-h>", vim.lsp.buf.signature_help, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "<leader>c", vim.lsp.buf.code_action, opts)
	map("n", "<leader>r", vim.lsp.buf.rename, opts)
end

-- Diagnostics signs
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󱠂", texthl = "LspDiagnosticsDefaultHint" })

-- Virtual text
vim.diagnostic.config({
	virtual_text = { prefix = "● " },
	severity_sort = true,
})

return settings
