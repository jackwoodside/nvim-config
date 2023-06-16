require("highlight-undo").setup({
	hlgroup = "Visual",
	duration = 500,
	keymaps = {
		{ "n", "u", "undo", {} },
		{ "n", "<C-r>", "redo", {} },
	},
})
