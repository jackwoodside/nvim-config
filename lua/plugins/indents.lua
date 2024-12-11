local indents = require("mini.indentscope")
indents.setup({
	draw = { animation = indents.gen_animation.none(), delay = 0 },

	options = {
		indent_at_cursor = false,
		try_as_border = true,
	},

	symbol = "┃",
})
