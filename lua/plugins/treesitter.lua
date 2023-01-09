require("nvim-treesitter.configs").setup({
	auto_install = true,
	ensure_installed = {
		"bash",
		"gitattributes",
		"gitcommit",
		"git_rebase",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"query",
		"regex",
		"vim",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gs",
			node_incremental = "gs",
			node_decremental = "gS",
			scope_incremental = "<leader>gc",
		},
	},
	-- nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["uc"] = "@comment.outer",

				-- Or you can define your own textobjects like this
				-- ['iF'] = {
				--     python = '(function_definition) @function',
				--     cpp = '(function_definition) @function',
				--     c = '(function_definition) @function',
				--     java = '(method_declaration) @function',
				-- },
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
	-- windwp/nvim-ts-autotag
	autotag = {
		enable = true,
	},
	-- nvim-treesitter/playground
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
	},
	-- nvim-treesitter/nvim-treesitter-refactor
	refactor = {
		highlight_definitions = { enable = true },
		-- highlight_current_scope = { enable = false },
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
