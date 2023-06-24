require("mini.surround").setup({
	mappings = {
		add = "ys",
		delete = "ds",
		find = "",
		find_left = "",
		highlight = "vs",
		replace = "cs",
		update_n_lines = "",
	},
	custom_surroundings = {
		-- LaTeX surrounds
		["$"] = { output = { left = "$", right = "$" } },
	},
	silent = true,
})
