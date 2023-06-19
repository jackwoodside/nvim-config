require("zen-mode").setup({
	vim.keymap.set("n", "<leader>z", "<CMD>ZenMode<CR>", { desc = "Zen mode", silent = true }),
	plugins = {
		gitsigns = { enabled = true },
		twilight = { enabled = true },
	},
})
