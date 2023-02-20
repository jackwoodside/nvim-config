-- Use gitsigns for diff source
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.modified,
			removed = gitsigns.removed,
		}
	end
end

-- Word count section for tex files
local va = vim.api
local vf = vim.fn

local function wordcount()
	if vf.expand("%:e") == "tex" then
		return va.nvim_buf_get_var(0, "words")
	else
		return ""
	end
end

va.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vf.expand("%:e") == "tex" then
			local words = vf.system("texcount " .. vf.shellescape(vf.expand("%:p")) .. " | awk 'FNR==3 {printf $NF}'")
			if words:find("command not found") ~= nil then
				va.nvim_buf_set_var(0, "words", "")
			elseif words == "1" then
				va.nvim_buf_set_var(0, "words", words .. " word")
			else
				va.nvim_buf_set_var(0, "words", words .. " words")
			end
		end
	end,
})
va.nvim_create_autocmd("BufWritePost", {
	callback = function()
		if vf.expand("%:e") == "tex" then
			local words = vf.system("texcount " .. vf.shellescape(vf.expand("%:p")) .. " | awk 'FNR==3 {printf $NF}'")
			if words:find("command not found") ~= nil then
				va.nvim_buf_set_var(0, "words", "")
			elseif words == "1" then
				va.nvim_buf_set_var(0, "words", words .. " word")
			else
				va.nvim_buf_set_var(0, "words", words .. " words")
			end
		end
	end,
})

require("lualine").setup({
	options = {
		theme = "catppuccin",
		component_separators = "",
		section_separators = "",
		icons_enabled = true,
		globalstatus = true,
		disabled_filetypes = { "starter", "toggleterm" },
	},
	extensions = { "nvim-dap-ui", "nvim-tree" },
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(m)
					return m:sub(1, 3)
				end,
				color = { gui = "bold" },
			},
		},
		lualine_b = {
			{ "branch" },
			{ "diff", source = diff_source, colored = true },
		},
		lualine_c = {
			{ "filename", file_status = true },
			{ "diagnostics" },
		},
		lualine_x = {},
		lualine_y = {
			{ wordcount },
		},
		lualine_z = {
			{ "location", color = { gui = "bold" } },
		},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				buffers_color = { active = "lualine_b_normal" },
				max_length = vim.o.columns,
				symbols = {
					modified = " [+]",
					alternate_file = "",
				},
			},
		},
	},
})
