local buf = vim.lsp.buf
local diagnostic = vim.diagnostic
local function map(m, k, v, b, d)
	vim.keymap.set(m, k, v, { buffer = b, desc = d, silent = true })
end

local lspconfig = require("lspconfig")

-- Settings
local function lsp_attach(_, bufnr) -- _ is client
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
local lsp_capabilities = function()
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	capabilities.offsetEncoding = { "utf-16" }
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return capabilities
end
local lsp_flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}
diagnostic.config({
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

-- Configured servers
--- LaTeX
local words = {}
local path = vim.fn.stdpath("config") .. "/lua/plugins/language/words.txt"
for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end

lspconfig["ltex"].setup({
	on_attach = lsp_attach(),
	capabilities = lsp_capabilities(),
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
	on_attach = lsp_attach(),
	capabilities = lsp_capabilities(),
	flags = lsp_flags,
	settings = {
		texlab = {
			build = {
				args = { "-pdf", "-shell-escape", "-interaction=nonstopmode", "-synctex=1", "%f" },
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

--- Lua
lspconfig["lua_ls"].setup({
	on_attach = lsp_attach(),
	capabilities = lsp_capabilities(),
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
	"pyright", -- Python
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = lsp_attach(),
		capabilities = lsp_capabilities(),
		flags = lsp_flags,
	})
end
