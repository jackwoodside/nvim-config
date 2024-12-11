local settings = {}
local diagnostic = vim.diagnostic
local buf = vim.lsp.buf

-- Capabilities
function settings.capabilities()
	-- local capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities = require("blink.cmp").get_lsp_capabilities()

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
vim.diagnostic.config({
	float = {
		header = "",
		suffix = "",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󱠂",
		},
	},
	severity_sort = true,
	update_in_insert = false,
	virtual_text = {
		prefix = "● ",
	},
})

return settings
