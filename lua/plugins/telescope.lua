local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end
local actions = require("telescope.actions")
local finders = require("telescope.builtin")

require("telescope").setup({
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

local Telescope = setmetatable({}, {
	__index = function(_, k)
		if vim.bo.filetype == "NvimTree" then
			vim.cmd.wincmd("l")
		end
		return finders[k]
	end,
})

-- Mnemonic is 'f'ind

-- Leader-fb = find buffers
map("n", "<leader>fb", Telescope.buffers)

-- Leader-fd = find diagnostics
map("n", "<leader>fd", Telescope.diagnostics)

-- Leader-ff = find files
map("n", "<leader>ff", function()
	local ok = vim.loop.fs_stat(vim.loop.cwd() .. "/.git")
	if ok then
		Telescope.git_files()
	else
		Telescope.find_files()
	end
end)

-- Leader-fg = find git
map("n", "<leader>fg", Telescope.git_status)

-- Leader-fh = find help
map("n", "<leader>fh", Telescope.help_tags)

-- Leader-fn = find notifications
map("n", "<leader>fn", "<CMD>lua require('telescope').extensions.notify.notify(<opts>)")

-- Leader-ft = find todos (todo-comments)
map("n", "<leader>ft", "<CMD>TodoTelescope<CR>")

-- Leader-/ = live grep
map("n", "<leader>/", Telescope.live_grep)
