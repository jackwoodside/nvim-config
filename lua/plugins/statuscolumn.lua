local builtin = require("statuscol.builtin")
require("statuscol").setup({
	relculright = true,
	ft_ignore = { "lazy", "man", "ministarter" },

	segments = {
		-- Folds
		-- {
		-- 	text = { builtin.foldfunc },
		-- },

		-- Diagnostics
		{
			sign = {
				namespace = { "diagnostic/signs" },
			},
		},

		-- Relative line numbers
		{
			text = { builtin.lnumfunc },
			condition = { true, builtin.not_empty },
		},

		-- Diffs
		{
			sign = {
				namespace = { "MiniDiffViz" },
				colwidth = 1,
				fillchar = "┃",
				wrap = true,
				foldclosed = true,
			},
		},
	},
})
