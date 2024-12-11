require("nvim-treesitter.configs").setup({
	auto_install = true,
	ensure_installed = {
		"bash",
		"c",
		"git_rebase",
		"gitattributes",
		"gitcommit",
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
			local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},

	-- nvim-treesitter/nvim-treesitter-refactor
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = false,
		},
	},

	-- nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- Comments are handled by mini.comment

				["ac"] = "@conditional.outer", -- around conditional
				["ic"] = "@conditional.inner", -- inside conditional

				["af"] = "@function.outer", -- around function
				["if"] = "@function.inner", -- inside function

				["al"] = "@loop.outer", -- around loop
				["il"] = "@loop.inner", -- inside loop
			},
		},
	},
})
require("treesitter-context").setup({ enable = true })

-- JoosepAlviste/nvim-ts-context-commentstring
require("ts_context_commentstring").setup = {
	enable_autocmd = false,
}
