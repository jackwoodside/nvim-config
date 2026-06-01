local ts = require("nvim-treesitter")

ts.install({
	"bash",
	"c",
	"diff",
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
})

ts.setup({
	folds = {
		enable = true,
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

	indent = {
		enable = true,
	},
})

require("nvim-treesitter-textobjects").setup({
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
})
