require("mini.git").setup()

-- Use only HEAD name as summary string
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniGitUpdated",
	callback = function(data)
		local summary = vim.b[data.buf].minigit_summary
		vim.b[data.buf].minigit_summary_string = summary.head_name or ""
	end,
})
