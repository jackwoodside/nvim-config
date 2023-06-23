local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end

local actions = require("telescope.actions")
local finders = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = " ❯ ",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<C-s>"] = actions.send_selected_to_qflist,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",
		},
	},
})

-- Mappings
local Telescope = setmetatable({}, {
	__index = function(_, k)
		if vim.bo.filetype == "NvimTree" then
			vim.cmd.wincmd("l")
		end
		return finders[k]
	end,
})

map("n", "<leader>fb", Telescope.buffers, "Buffers")
map("n", "<leader>fd", Telescope.diagnostics, "Diagnostics")
map("n", "<leader>ff", function()
	local git = vim.loop.fs_stat(vim.loop.cwd() .. "/.git")
	if git then
		Telescope.git_files()
	else
		Telescope.find_files()
	end
end, "Files")
map("n", "<leader>fg", Telescope.git_status, "Git changes")
map("n", "<leader>fh", Telescope.help_tags, "Help")
map("n", "<leader>fn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", "Notifications")

-- Leader-/ = live grep
map("n", "<leader>/", "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Search project")
