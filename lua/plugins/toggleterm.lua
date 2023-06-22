require("toggleterm").setup({
	open_mapping = "<A-t>",
	shade_terminals = false,
	direction = "float",
	winbar = {
		enabled = false,
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _Lazygit_toggle()
	lazygit:toggle()
end
