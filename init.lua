-- Neovim settings, mappings and autocmds
require("settings")
require("keymaps")
require("autocmds")

-- Plugin management
require("plugins")

--Pretty print lua table
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end
