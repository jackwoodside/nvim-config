local hl = require("mini.hipatterns")
hl.setup({
	highlighters = {
		-- Comments
		fix = { pattern = "%f[%w]()FIX()%f[%W]", group = "MiniHipatternsFixme" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Hex colours
		hex_colour = hl.gen_highlighter.hex_color(),
	},
})
