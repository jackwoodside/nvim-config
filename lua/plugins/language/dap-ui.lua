local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
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
map("n", "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint")

-- Leader-dc = debug continue
map("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>", "Continue")

-- Leader-dd = debug ui toggle
map("n", "<leader>dd", "<CMD>lua require('dapui').toggle()<CR>", "Toggle UI")

-- Leader-dr = debug restart
map("n", "<leader>dr", "<CMD>lua require('dap').restart()<CR>", "Restart")

-- Leader-df = debug step forward
map("n", "<leader>df", "<CMD>lua require('dap').step_over()<CR>", "Step forward")

-- Leader-db = debug step backward
map("n", "<leader>du", "<CMD>lua require('dap').step_back()<CR>", "Step backward")
