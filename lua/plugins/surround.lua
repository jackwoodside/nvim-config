require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		find = "gsf",
		find_left = "gsF",
		highlight = "gsh",
		replace = "gsr",
		update_n_lines = "",
	},
	custom_surroundings = {
		-- LaTeX surrounds
		["$"] = { output = { left = "$", right = "$" } },
	},
	silent = true,
})
