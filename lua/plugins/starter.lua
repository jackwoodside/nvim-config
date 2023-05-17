local starter = require("mini.starter")
starter.setup({
	items = { { name = "", action = "", section = "" } },
	content_hooks = {
		starter.gen_hook.aligning("center", "bottom"),
	},
	header = "",
	footer = "",
})
