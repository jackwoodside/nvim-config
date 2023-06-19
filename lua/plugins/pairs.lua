require("mini.pairs").setup({
	mappings = {
		-- LaTeX pairs
		["`"] = { action = "closeopen", pair = "`'", neigh_pattern = "[^\\].", register = { cr = false } },
		["$"] = { action = "closeopen", pair = "$$", neigh_pattern = "[^\\].", register = { cr = false } },
	},
})
