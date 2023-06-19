local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end
require("leap").setup({
	map({ "n", "x", "o" }, "f", "<Plug>(leap-forward-to)", "Leap forward to"),
	map({ "n", "x", "o" }, "F", "<Plug>(leap-backward-to)", "Leap backward to"),
	map({ "x", "o" }, "x", "<Plug>(leap-forward-till)", "Leap forward until"),
	map({ "x", "o" }, "X", "<Plug>(leap-backward-till)", "Leap backward until"),
})
