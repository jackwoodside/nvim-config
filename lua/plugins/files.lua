require("mini.files").setup({
	mappings = {
		close = "q",
		go_in_plus = "l",
		go_out = "h",
		reset = "<BS>",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},
})
vim.keymap.set(
	"n",
	"<leader>t",
	"<CMD>lua require('mini.files').open(nil, false)<CR>",
	{ desc = "File browser", silent = true }
)
