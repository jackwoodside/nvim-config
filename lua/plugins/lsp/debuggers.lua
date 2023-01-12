-- Debuggers
require("mason-nvim-dap").setup({
	ensure_installed = {
		"bash", -- bash-debug-adapter
		"cppdbg", -- cpptools
	},
	automatic_setup = true,
})

-- Settings
require("mason-nvim-dap").setup_handlers()

require("dap")
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
