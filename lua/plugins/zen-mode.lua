return {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>z", mode = "n", "<CMD>ZenMode<CR>", desc = "Zen mode" },
	},
	opts = {
		plugins = {
			gitsigns = { enabled = true },
			twilight = { enabled = true },
		},
	},
}
