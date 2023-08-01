local ufo = require("ufo")
local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end

ufo.setup()

map("n", "<SPACE>", "za", "Toggle fold under cursor")
map("n", "zO", ufo.openAllFolds, "Open all folds")
map("n", "zC", ufo.closeAllFolds, "Close all folds")
