local hydra = require("hydra")

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

local hint = [[
_b_: Buffers     _d_: Diagnostics _f_: Files
_g_: Git changes _h_: Help        _n_: Notifications
               _q_: Quit
]]

hydra({
	hint = hint,
	config = {
		color = "teal",
		invoke_on_body = true,
		hint = { position = "middle" },
	},

	body = "<leader>f",
	heads = {
		-- Finders
		{ "b", Telescope.buffers, { desc = "Buffers", silent = true } },
		{ "d", Telescope.diagnostics, { desc = "Diagnostics", silent = true } },
		{
			"f",
			function()
				local ok = vim.loop.fs_stat(vim.loop.cwd() .. "/.git")
				if ok then
					Telescope.git_files()
				else
					Telescope.find_files()
				end
			end,
			{ desc = "Files", silent = true },
		},
		{ "g", Telescope.git_status, { desc = "Git changes", silent = true } },
		{ "h", Telescope.help_tags, { desc = "Help", silent = true } },
		{
			"n",
			"<CMD>lua require('telescope').extensions.notify.notify()<CR>",
			{ desc = "Notifications", silent = true },
		},
		-- Exit
		{ "q", nil, { desc = "Exit", exit = true } },
	},
})

-- Leader-/ = live grep
map("n", "<leader>/", "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Search project")
