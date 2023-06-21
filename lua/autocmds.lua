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
ac("VimEnter", {
	callback = function()
		local arg = vim.api.nvim_eval("argv(0)")
		local man = (ft == "man")
		if arg and (fn.isdirectory(arg) ~= 0 or arg == "") and not man then
			vim.defer_fn(function()
				require("telescope.builtin").find_files()
			end, 10)
		end
	end,
})
