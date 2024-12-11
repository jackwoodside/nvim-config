local highlights = require("mini.hipatterns")
highlights.setup({
	highlighters = {
		hex_color = highlights.gen_highlighter.hex_color(),
		todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
	},
})
