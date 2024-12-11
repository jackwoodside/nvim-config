require("mini.diff").setup({
	-- TODO configure
	view = {
		style = "sign",
		signs = { add = "┃", change = "┃", delete = "┃" },
	},
})

-- Only print changes, not number of chunks
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniDiffUpdated",
	callback = function(data)
		local summary = vim.b[data.buf].minidiff_summary
		local t = {}
		if summary.add > 0 then
			table.insert(t, "+" .. summary.add)
		end
		if summary.change > 0 then
			table.insert(t, "~" .. summary.change)
		end
		if summary.delete > 0 then
			table.insert(t, "-" .. summary.delete)
		end
		vim.b[data.buf].minidiff_summary_string = table.concat(t, " ")
	end,
})
