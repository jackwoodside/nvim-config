local settings = {}
local diagnostic = vim.diagnostic
local buf = vim.lsp.buf

-- Capabilities
function settings.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	capabilities.offsetEncoding = { "utf-16" }
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return capabilities
end

-- Flags
settings.flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}

-- Disable LSP formatting, only use null-ls
function settings.formatting(bufnr)
	buf.format({
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
	map("n", "[d", diagnostic.goto_prev, bufnr, "Next diagnostic")
	map("n", "]d", diagnostic.goto_next, bufnr, "Previous diagnostic")

	map("n", "gd", buf.definition, bufnr, "Go to definition")
	map("n", "gD", buf.declaration, bufnr, "Go to declaration")
	map("n", "gi", buf.implementation, bufnr, "Go to implementation")

	map("n", "<leader>la", buf.code_action, bufnr, "Action")
	-- map("n", "<leader>la", require("actions-preview").code_actions, bufnr, "Action")
	map("n", "<leader>li", buf.hover, bufnr, "Information")
	map("n", "<leader>lr", buf.rename, bufnr, "Rename")
	map("n", "<leader>ls", buf.signature_help, bufnr, "Signature")
end

-- Diagnostic visuals
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󱠂", texthl = "LspDiagnosticsDefaultHint" })
vim.diagnostic.config({
	float = {
		header = "",
		suffix = "",
	},
	severity_sort = true,
	virtual_text = {
		prefix = "● ",
	},
	update_in_insert = false,
})

return settings
