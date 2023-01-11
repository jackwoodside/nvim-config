local settings = {}

-- Capabilities with nvim-cmp
function settings.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

-- Disable server formatting (handled by null-ls)
function settings.disable_formatting(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = true
end

-- Format-on-save
function settings.fmt_on_save(client, buf)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = buf,
			callback = function()
				vim.lsp.buf.format({
					timeout_ms = 3000,
					buffer = buf,
				})
			end,
		})
	end
end

-- Keybinds
local function map(m, k, v, opts)
	vim.keymap.set(m, k, v, opts)
end

function settings.mappings(buf)
	local opts = { buffer = buf }
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

return settings
