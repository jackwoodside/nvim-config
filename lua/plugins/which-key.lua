local wk = require("which-key")
wk.setup({})
-- Register prefix names
wk.register({
	d = { name = "DAP menu" },
	f = { name = "Telescope menu" },
	g = { name = "Git menu" },
}, { prefix = "<leader>" })
