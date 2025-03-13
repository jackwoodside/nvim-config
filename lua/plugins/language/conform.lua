local va = vim.api

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		cpp = { "clang-format" },
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
