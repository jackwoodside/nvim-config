local settings = require("plugins.language.settings")

-- Grab settings
local lspconfig = require("lspconfig")
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
lsp_capabilities.offsetEncoding = { "utf-16" }
local lsp_flags = settings.flags

-- Configured servers
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
				["en-AU"] = { "EN_UNPAIRED_BRACKETS", "PASSIVE_VOICE", "REP_PASSIVE_VOICE", "PASSIVE_VOICE_SIMPLE" },
			},
			language = "en-AU",
			latex = {
				commands = {
					["\\author{}"] = "ignore",
					["\\bibliographystyle{}"] = "ignore",
					["\\documentclass[]{}"] = "ignore",
					["\\note{}"] = "ignore",
					["\\pgfplotsset{}"] = "ignore",
					["\\usepgfplotslibrary{}"] = "ignore",
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
					"booktabs",
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
				globals = { "vim" },
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

-- Unconfigured servers
local servers = {
	"clangd", -- C++
	"nil_ls", -- Nix
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
		flags = lsp_flags,
	})
end
