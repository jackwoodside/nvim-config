local pick = require("mini.pick")
local builtins = pick.builtin
local extras = require("mini.extra").pickers

-- TODO show search and preview side by side
local win_config = function()
	local height = math.floor(0.7 * vim.o.lines)
	local width = math.floor(0.8 * vim.o.columns)
	return {
		anchor = "NW",
		height = height,
		width = width,
		row = math.floor(0.5 * (vim.o.lines - height)),
		col = math.floor(0.5 * (vim.o.columns - width)),
	}
end

pick.setup({
	window = {
		prompt_prefix = " ",
		config = win_config,
	},
})
vim.ui.select = pick.ui_select

local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end

map("n", "<leader>fb", builtins.buffers, "Buffers")
map("n", "<leader>fd", extras.diagnostic, "Diagnostics")
map("n", "<leader>ff", function()
	local git = vim.uv.fs_stat(vim.uv.cwd() .. "/.git")
	if git then
		extras.git_files()
	else
		builtins.files()
	end
end, "Files")
map("n", "<leader>fh", builtins.help, "Help")

map("n", "<leader>/", builtins.grep_live, "Search directory")

map("n", "<leader>fld", function()
	extras.lsp({ scope = "definition" })
end, "Definitions")
map("n", "<leader>fli", function()
	extras.lsp({ scope = "implementation" })
end, "Implementations")
map("n", "<leader>fls", function()
	extras.lsp({ scope = "document_symbol" })
end, "Symbols")
map("n", "<leader>flr", function()
	extras.lsp({ scope = "references" })
end, "References")
