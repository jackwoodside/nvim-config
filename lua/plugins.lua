return require("lazy").setup({
	-- Dependencies
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",

	-- LSP
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup({ PATH = "append" })
		end,
	},

	{ "neovim/nvim-lspconfig", event = "BufReadPre" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugins.lsp.servers")
		end,
	},

	{ "jose-elias-alvarez/null-ls.nvim", event = "BufReadPre" },
	{
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("plugins.lsp.linters")
		end,
	},

	{ "mfussenegger/nvim-dap", event = "BufReadPre" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("plugins.lsp.debuggers")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		config = function()
			require("plugins.lsp.dap-ui")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		event = "VeryLazy",
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
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-path" },
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "nvim-treesitter/nvim-treesitter-refactor" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	},

	-- Misc.
	-- Auto-Pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
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
		event = "VeryLazy",
		config = function()
			require("mini.comment").setup()
		end,
	},

	-- File Browser
	{
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		keys = {
			{ "<leader>t", "<CMD>lua require('notify').dismiss()<CR><CMD>NvimTreeToggle<CR>" },
		},
		config = function()
			require("plugins.nvim-tree")
		end,
	},

	-- Finder
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
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
		event = "BufReadPre",
		config = function()
			require("plugins.gitsigns")
		end,
	},

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

	-- Indentation Guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			require("plugins.indentline")
		end,
	},

	-- Navigation
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").add_default_mappings(true)
		end,
	},
	{
		"ggandor/leap-spooky.nvim",
		event = "VeryLazy",
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
		event = "VimEnter",
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
		cmd = "TodoTelescope",
		event = "BufReadPost",
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
		event = "VeryLazy",
		config = function()
			require("plugins.noice")
		end,
	},
}, { lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json" })
