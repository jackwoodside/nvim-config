require("statuscol").setup({
	vim.keymap.set("n", "<leader>zz", "<CMD>ZenMode<CR>", { silent = true }),
	plugins = {
		gitsigns = { enabled = true },
		twilight = { enabled = true },
	},
})
