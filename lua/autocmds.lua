local ac = vim.api.nvim_create_autocmd
local fn = vim.fn
local ft = vim.bo.filetype

-- Highlight on yank
ac("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
	end,
})

-- Disable newline comments
ac("BufEnter", {
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

-- Clear extra latex files
ac("VimLeave", {
	callback = function()
		if ft == "tex" then
			io.popen("tex-clear " .. fn.shellescape(fn.expand("%:p")))
		end
	end,
})

-- Start git commits in insert mode
ac("FileType", { pattern = { "gitcommit", "gitrebase" }, command = [[ startinsert | 1 ]] })
