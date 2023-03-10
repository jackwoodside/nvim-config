local ac = vim.api.nvim_create_autocmd
local vf = vim.fn

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
		if vf.expand("%:e") == "tex" then
			io.popen("tex-clear " .. vf.shellescape(vf.expand("%:p")))
		end
	end,
})

-- Start git commits in insert mode
ac("FileType", { pattern = { "gitcommit", "gitrebase" }, command = [[ startinsert | 1 ]] })
