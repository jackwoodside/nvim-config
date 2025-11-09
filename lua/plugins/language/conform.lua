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
	formatters = {
		latexindent = {
			append_args = { "-g", "/tmp/latexindent.log" },
		},
	},

	format_on_save = {
		timeout_ms = 2000,
	},
})
