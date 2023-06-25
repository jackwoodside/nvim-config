local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end
local flash = require("flash")

flash.setup({
	jump = {
		nohlsearch = true,
		autojump = true,
	},
	modes = {
		char = {
			keys = { "f", "F", "t", "T" },
		},
		search = { enabled = false },
	},
})
map({ "n", "x", "o" }, "s", function()
	flash.jump()
end, "Flash")
map({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, "Flash Treesitter")
map("o", "r", function()
	flash.remote()
end, "Remote Flash")
