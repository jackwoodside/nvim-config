local mp = require("mini.pairs")

mp.setup()
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "tex",
-- 	callback = function()
-- 		mp.map_buf({ buffer = 0 }, { mode = "i" }, { lhs = "$" }, {
-- 			pair_info = {
-- 				action = "closeopen",
-- 				pair = "$$",
-- 				neigh_pattern = "[^\\].",
-- 				register = { cr = false },
-- 			},
-- 		})
-- 	end,
-- })
