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

map({ "n", "x", "o" }, "gs", flash.jump, "Flash")
map({ "n", "x", "o" }, "gS", flash.treesitter, "Flash Treesitter")
map("o", "r", flash.remote, "Remote Flash")
