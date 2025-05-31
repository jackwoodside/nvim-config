local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		cpp = { "clang-format" },
		json = { "jq" },
		lua = { "stylua" },
		nix = { "nixfmt" },
		python = { "black" },
		sh = { "shfmt" },
		tex = { "latexindent" },
	},

	format_on_save = {
		timeout_ms = 2000,
	},
})
