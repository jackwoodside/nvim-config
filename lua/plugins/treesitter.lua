require("nvim-treesitter.configs").setup({
	auto_install = true,
	ensure_installed = {
		"bash",
		"c",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"help",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"query",
		"regex",
		"vim",
		"vimdoc",
	},

	highlight = {
		enable = true,
		-- Disable for files larger than 100 KB
		disable = function(_, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},

	-- JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	-- nvim-treesitter/nvim-treesitter-refactor
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = false,
		},
		highlight_current_scope = { enable = true },
	},

	-- nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["ac"] = "@class.outer", -- around class
				["ic"] = "@class.inner", -- inner class

				["af"] = "@function.outer", -- around function
				["if"] = "@function.inner", -- inner function

				["ai"] = "@conditional.outer", -- around if
				["ii"] = "@conditional.inner", -- inner if

				["al"] = "@loop.outer", -- around loop
				["il"] = "@loop.inner", -- inner loop
			},
		},
	},
})
require("treesitter-context").setup({ enable = true })
