local map = vim.keymap.set
local U = {}
local fmt_group = vim.api.nvim_create_augroup("FORMATTING", { clear = true })

-- Common format-on-save
function U.fmt_on_save(client, buf)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = fmt_group,
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

-- LSP servers capabilities with nvim-cmp
function U.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

-- Disable formatting for servers, null-ls handles instead
function U.disable_formatting(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = true
end

-- LSP mappings
function U.mappings(buf)
	local opts = { buffer = buf }

	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	map("n", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	map("n", "[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	map("n", "]g", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	map("n", "<leader>s", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
end

return U
