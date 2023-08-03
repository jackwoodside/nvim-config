local clue = require("mini.clue")
clue.setup({
	triggers = {
		-- Folds
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },

		-- 'g'
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Leader
		{ mode = "n", keys = "<leader>" },
		{ mode = "x", keys = "<leader>" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },
	},

	clues = {
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.z(),

		{ mode = "n", keys = "<leader>d", desc = "+DAP" },
		{ mode = "n", keys = "<leader>f", desc = "+Find" },
		{ mode = "n", keys = "<leader>g", desc = "+Git" },
		{ mode = "n", keys = "<leader>l", desc = "+Language" },
	},

	window = {
		delay = 500,
		scroll_up = "<C-PageUp>",
		scroll_down = "<C-PageDown>",
	},
})
