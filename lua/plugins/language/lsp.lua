local settings = require("plugins.language.settings")

-- Servers
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"julials",
		"ltex",
		"lua_ls",
		"nil_ls",
		"texlab",
	},
})
-- Configure servers
local lspconfig = require("lspconfig")
local get_servers = require("mason-lspconfig").get_installed_servers
local function lsp_attach(client, bufnr)
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
end
local lsp_capabilities = settings.capabilities()
local lsp_flags = settings.flags

-- Loop over all servers
for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
		flags = lsp_flags,
	})
end

-- Server-specific settings
---- C++
require("clangd_extensions").setup({
	extensions = {
		autoSetHints = true,
		inlay_hints = { only_current_line = true },
	},
})

---- LaTeX
local words = {}
local path = vim.fn.stdpath("config") .. "/lua/plugins/language/words.txt"
for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end

lspconfig["ltex"].setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	flags = lsp_flags,
	filetypes = { "bib", "plaintex", "tex" },
	settings = {
		ltex = {
			additionalRules = { enablePickyRules = true },
			checkFrequency = "save",
			dictionary = {
				["en-AU"] = words,
			},
			disabledRules = {
				["en-AU"] = { "EN_UNPAIRED_BRACKETS" },
			},
			language = "en-AU",
			latex = {
				commands = {
					["\\author{}"] = "ignore",
					["\\note{}"] = "ignore",
					["\\pgfplotsset{}"] = "ignore",
				},
				environments = {
					["align"] = "ignore",
					["equation"] = "ignore",
				},
			},
		},
	},
})

lspconfig["texlab"].setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	flags = lsp_flags,
	settings = {
		texlab = {
			build = {
				onSave = true,
				forwardSearchAfter = true,
			},
			chktex = { onOpenAndSave = true },
			forwardSearch = {
				executable = "sioyek",
				args = {
					"--forward-search-file",
					"%f",
					"--forward-search-line",
					"%l",
					"%p",
				},
			},
			diagnostics = {
				ignoredPatterns = {
					"Fira fonts",
				},
			},
		},
	},
})

---- Lua
lspconfig["lua_ls"].setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	flags = lsp_flags,
	settings = {
		Lua = {
			completion = {
				enable = true,
				showWord = "Disable",
			},
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim", "xplr" },
			},
			workspace = {
				library = { os.getenv("VIMRUNTIME") },
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
