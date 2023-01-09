local nls = require("null-ls")
local U = require("plugins.lsp.utils")

local cda = nls.builtins.code_actions
local cmp = nls.builtins.completion
local dgn = nls.builtins.diagnostics
local fmt = nls.builtins.formatting

-- Configuring null-ls
nls.setup({
	sources = {
		-- Code actions
		cda.shellcheck,
		-- Completion
		cmp.luasnip,
		-- Diagnostics
		dgn.checkmake,
		dgn.luacheck.with({
			extra_args = { "--globals", "vim", "--std", "luajit" },
		}),
		dgn.shellcheck,
		-- Formatting
		fmt.latexindent,
		fmt.nixfmt,
		fmt.rustfmt,
		fmt.shfmt.with({
			extra_args = { "-i", 4, "-ci", "-sr" },
		}),
		fmt.stylua,
		fmt.trim_whitespace.with({
			filetypes = { "text", "zsh", "toml", "make", "conf", "tmux" },
		}),
	},
	on_attach = function(client, bufnr)
		U.fmt_on_save(client, bufnr)
		U.mappings(bufnr)
	end,
})
