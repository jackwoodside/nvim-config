local function map(m, k, v, opts)
	vim.keymap.set(m, k, v, opts)
end

-- Settings
require("dapui").setup({
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "right",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25,
			position = "bottom",
		},
	},
})

-- Mappings
-- Mnemonic is 'd'ebug

-- Leader-db = debug breakpoint
map("n", "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>")

-- Leader-dc = debug continue
map("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>")

-- Leader-dd = debug ui toggle
map("n", "<leader>dd", "<CMD>lua require('dapui').toggle()<CR>")

-- Leader-ds = debug step
map("n", "<leader>ds", "<CMD>lua require('dap').step_over()<CR>")
