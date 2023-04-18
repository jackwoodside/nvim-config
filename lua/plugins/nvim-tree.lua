require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 35,
		side = "right",
	},
	filters = {
		custom = { ".git$" },
		dotfiles = true,
	},
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
	renderer = {
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = false,
			},
			glyphs = {
				default = "",
				git = {
					unstaged = "~",
					staged = "+",
					unmerged = "!",
					renamed = "≈",
					untracked = "?",
					deleted = "-",
				},
			},
		},
		indent_markers = {
			enable = true,
		},
	},
})

vim.keymap.set("n", "<leader>t", "<CMD>lua require('notify').dismiss()<CR><CMD>NvimTreeToggle<CR>")

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("NVIM_TREE", { clear = true }),
	pattern = "NvimTree",
	callback = function()
		vim.api.nvim_win_set_option(0, "wrap", false)
	end,
})
