local pairs = require("mini.pairs")
pairs.setup()

local tex_pairs = function()
	pairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
	pairs.map_buf(0, "i", "`", { action = "closeopen", pair = "`'" })
end
vim.api.nvim_create_autocmd("FileType", { pattern = "tex", callback = tex_pairs })
