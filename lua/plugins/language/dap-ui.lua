local dap = require("dap")
local ui = require("dapui")
local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end

-- Settings
ui.setup({
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
map("n", "<leader>db", dap.toggle_breakpoint, "Toggle breakpoint")
map("n", "<leader>dc", dap.continue, "Continue")
map("n", "<leader>dd", ui.toggle, "Toggle UI")
map("n", "<leader>dr", dap.restart, "Restart")
map("n", "<leader>ds", dap.step_over, "Step forward")
map("n", "<leader>dS", dap.step_back, "Step backward")
