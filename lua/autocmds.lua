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

-- Open telescope if folder or no file specified
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = vim.api.nvim_eval("argv(0)")
		local man = (vim.bo.filetype == "man")
		if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") and not man then
			vim.defer_fn(function()
				local git = vim.loop.fs_stat(vim.loop.cwd() .. "/.git")
				local telescope = require("telescope.builtin")
				if git then
					telescope.git_files()
				else
					telescope.find_files()
				end
			end, 10)
		end
	end,
})
