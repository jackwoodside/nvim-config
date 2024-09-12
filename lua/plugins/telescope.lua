local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end

local actions = require("telescope.actions")
local finders = require("telescope.builtin")
local telescope = require("telescope")
local extensions = telescope.extensions

telescope.setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "❯ ",
		initial_mode = "insert",
		sorting_strategy = "ascending",

		-- Layout
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
		},

		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- Mappings
map("n", "<leader>fb", finders.buffers, "Buffers")
map("n", "<leader>fd", finders.diagnostics, "Diagnostics")
map("n", "<leader>ff", function()
	local git = vim.loop.fs_stat(vim.loop.cwd() .. "/.git")
	if git then
		finders.git_files()
	else
		finders.find_files()
	end
end, "Files")
map("n", "<leader>fg", finders.git_status, "Git changes")
map("n", "<leader>fh", finders.help_tags, "Help")
map("n", "<leader>fn", extensions.notify.notify, "Notifications")
map("n", "<leader>fr", finders.lsp_references, "References")
map("n", "<leader>fs", finders.lsp_dynamic_workspace_symbols, "Symbols")

-- Leader-/ = live grep
map("n", "<leader>/", extensions.live_grep_args.live_grep_args, "Live Grep")
