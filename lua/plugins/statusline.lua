-- TODO add latex wordcount
local statusline = require("mini.statusline")

local active_content = function()
	local mode, mode_hl = statusline.section_mode({})
	local git = statusline.section_git({})
	local diff = statusline.section_diff({
		icon = "┃ ",
	})
	local diagnostics = statusline.section_diagnostics({
		icon = "┃",
		signs = { ERROR = " ", WARN = " ", INFO = " ", HINT = "󱠂 " },
	})
	local filename = statusline.section_filename({})

	local fileinfo = statusline.section_fileinfo({ trunc_width = 99999 }) -- always show short output

	return statusline.combine_groups({
		{ hl = mode_hl, strings = { string.upper(mode:sub(1, 3)) } },
		{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
		{ hl = "MiniStatuslineFilename", strings = { filename } },

		"%=", -- Middle split
		{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
	})
end

statusline.setup({
	content = {
		active = active_content,
	},
})
