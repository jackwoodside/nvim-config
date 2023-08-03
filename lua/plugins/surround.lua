require("mini.surround").setup({
	mappings = {
		add = "sa",
		delete = "sd",
		find = "sf",
		find_left = "sF",
		highlight = "sh",
		replace = "sr",
		update_n_lines = "",
	},
	custom_surroundings = {
		-- LaTeX surrounds
		["$"] = { output = { left = "$", right = "$" } },
	},
	silent = true,
})
