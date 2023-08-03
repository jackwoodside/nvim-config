local files = require("mini.files")

files.setup({
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
vim.keymap.set("n", "<leader>t", function()
	files.open(nil, false)
end, { desc = "File browser", silent = true })
