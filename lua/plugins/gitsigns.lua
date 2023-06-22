local gs = require("gitsigns")
local hydra = require("hydra")

local hint = [[
_]_: Next hunk    _s_: Stage hunk   _p_: Preview hunk _g_: Lazygit
_[_: Prev hunk    _S_: Stage buffer _u_: Undo hunk    _q_: Quit
]]
local vc = vim.cmd

gs.setup({
	signs = {
		changedelete = { text = "┃" },
	},

	on_attach = function(bufnr)
		hydra({
			name = "GIT",
			hint = hint,
			config = {
				buffer = bufnr,
				color = "pink",
				invoke_on_body = true,
				on_enter = function()
					vc("mkview")
					vc("silent! %foldopen!")
					vim.bo.modifiable = false
					gs.toggle_linehl(true)
				end,
				on_exit = function()
					local cursor_pos = vim.api.nvim_win_get_cursor(0)
					vc("loadview")
					vim.api.nvim_win_set_cursor(0, cursor_pos)
					vc("normal zv")
					gs.toggle_linehl(false)
				end,
			},

			body = "<leader>g",
			heads = {
				-- Commands
				{ "p", gs.preview_hunk, { desc = "Preview hunk", nowait = true } },
				{ "s", gs.stage_hunk, { desc = "Stage hunk", nowait = true, silent = true } },
				{ "S", gs.stage_buffer, { desc = "Stage buffer", nowait = true } },
				{ "u", gs.undo_stage_hunk, { desc = "Undo hunk", nowait = true } },
				-- Navigation
				{
					"]",
					[[ &diff ? ']h' : '<CMD>Gitsigns next_hunk<CR>' ]],
					{ desc = "Next hunk", expr = true, nowait = true },
				},
				{
					"[",
					[[ &diff ? '[h' : '<CMD>Gitsigns prev_hunk<CR>' ]],
					{ desc = "Previous hunk", expr = true, nowait = true },
				},
				-- Exit
				{ "g", "<CMD>lua _Lazygit_toggle()<CR>", { desc = "Lazygit", exit = true, nowait = true } },
				{ "q", nil, { desc = "Exit", exit = true, nowait = true } },
			},
		})
	end,
})
