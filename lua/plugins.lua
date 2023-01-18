return require("lazy").setup({
	-- Dependencies
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",

	-- LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({ PATH = "append" })
		end,
	},

	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugins.lsp.servers")
		end,
	},

	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("plugins.lsp.linters")
		end,
	},

	{ "mfussenegger/nvim-dap" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("plugins.lsp.debuggers")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("plugins.lsp.dap-ui")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.lsp.cmp")
		end,
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				config = function()
					require("plugins.lsp.snippets")
				end,
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
	},
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-path" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "CursorHold",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "nvim-treesitter/nvim-treesitter-refactor" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },

	-- Misc.
	-- Auto-Pairs
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	-- Colour Highlighter
	{
		"norcalli/nvim-colorizer.lua",
		event = "CursorHold",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Commenting
	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup()
		end,
	},

	-- File Browser
	{
		"kyazdani42/nvim-tree.lua",
		event = "CursorHold",
		config = function()
			require("plugins.nvim-tree")
		end,
	},

	-- Finder
	{
		"nvim-telescope/telescope.nvim",
		event = "CursorHold",
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("telescope").load_extension("fzf")
		end,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins.gitsigns")
		end,
	},

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

	-- Indentation Guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.indentline")
		end,
	},

	-- Navigation
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings(true)
		end,
	},
	{
		"ggandor/leap-spooky.nvim",
		config = function()
			require("leap-spooky").setup()
		end,
	},

	-- Notifications
	{
		"rcarriga/nvim-notify",
		config = function()
			require("plugins.notify")
		end,
	},

	-- Startscreen
	{
		"echasnovski/mini.starter",
		config = function()
			require("plugins.starter")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("plugins.lualine")
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	},

	-- Theme
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("plugins.catppuccin")
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},

	-- Todo
	{
		"folke/todo-comments.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- UI Overhaul
	{
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("plugins.noice")
		end,
	},
}, { lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json" })
