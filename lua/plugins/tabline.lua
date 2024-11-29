local tabline = require("mini.tabline")

tabline.setup({
	format = function(buf_id, label)
		local suffix = vim.bo[buf_id].modified and "[+]" or ""
		return tabline.default_format(buf_id, label) .. suffix
	end,
	show_icons = true,
})
-- TODO configure
