local starter = require("mini.starter")
starter.setup({
	header = "",
	items = {
		starter.sections.recent_files(10, false),
		starter.sections.recent_files(10, true),
	},
	footer = "",
	content_hooks = {
		starter.gen_hook.adding_bullet(),
		starter.gen_hook.aligning("center", "center"),
	},
})
