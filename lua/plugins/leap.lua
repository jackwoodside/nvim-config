local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end
require("leap").setup({
	map({ "n", "x", "o" }, "f", "<Plug>(leap-forward-to)"),
	map({ "n", "x", "o" }, "F", "<Plug>(leap-backward-to)"),
	map({ "x", "o" }, "x", "<Plug>(leap-forward-till)"),
	map({ "x", "o" }, "X", "<Plug>(leap-backward-till)"),
})
