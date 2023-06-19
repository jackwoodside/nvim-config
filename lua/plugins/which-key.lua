local wk = require("which-key")
wk.setup({})
-- Register prefix names
wk.register({
	d = { name = "Debugger commands" },
	f = { name = "Finders (Telescope)" },
	g = { name = "Git commands" },
}, { prefix = "<leader>" })
