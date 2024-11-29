local statusline = require("mini.statusline")

statusline.setup({
	-- content = {
	-- 	active = function()
	-- 		local mode, mode_hl = statusline.section_mode()
	--
	-- 		return statusline.combine_groups({
	-- 			{ hl = mode_hl, strings = { mode:sub(1, 3) } },
	-- 		})
	-- 	end,
	-- 	inactive = nil,
	-- },
	use_icons = true,
})
-- TODO configure
