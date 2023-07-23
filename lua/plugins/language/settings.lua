local settings = {}

-- Capabilities
function settings.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	capabilities.offsetEncoding = { "utf-16" }
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

-- Flags
settings.flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}

-- Disable LSP formatting, only use null-ls
function settings.formatting(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
		timeout_ms = 5000,
	})
end

-- Format on save
settings.augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Keybinds
local function map(m, k, v, b, d)
	vim.keymap.set(m, k, v, { buffer = b, desc = d, silent = true })
end

function settings.mappings(bufnr)
	map("n", "[d", vim.diagnostic.goto_prev, bufnr, "Next diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, bufnr, "Previous diagnostic")
	map("n", "gd", vim.lsp.buf.definition, bufnr, "Go to definition")
	map("n", "gD", vim.lsp.buf.declaration, bufnr, "Go to declaration")
	map("n", "gh", vim.lsp.buf.hover, bufnr, "Hover information")
	map("n", "<C-h>", vim.lsp.buf.signature_help, bufnr)
	map("n", "gi", vim.lsp.buf.implementation, bufnr, "Go to implementation")
	map("n", "<leader>c", vim.lsp.buf.code_action, bufnr, "Code action")
	map("n", "<leader>r", vim.lsp.buf.rename, bufnr, "Rename")
end

-- Diagnostic visuals
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󱠂", texthl = "LspDiagnosticsDefaultHint" })
vim.diagnostic.config({
	float = false,
	severity_sort = true,
	virtual_text = false,
})

return settings
