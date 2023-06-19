require("mini.surround").setup({
	custom_surroundings = {
		-- LaTeX surrounds
		["$"] = { output = { left = "$", right = "$" } },
	},
})
