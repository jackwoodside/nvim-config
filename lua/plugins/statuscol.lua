local builtin = require("statuscol.builtin")
require("statuscol").setup({
	relculright = true,
	ft_ignore = { "man", "NvimTree", "starter", "TelescopePrompt" },
	segments = {
		-- Diagnostics
		{
			sign = {
				name = { "Diagnostic.*" },
				maxwidth = 1,
			},
		},

		-- Relative Line Numbers
		{
			text = { builtin.lnumfunc, " " },
			condition = { true, builtin.not_empty },
		},

		-- Gitsigns
		{
			sign = {
				name = { "GitSigns.*" },
				maxwidth = 1,
				colwidth = 1,
				fillchar = "┃",
				wrap = true,
			},
		},
	},
})
