return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {},

	config = function()
		local hop = require("hop")
		local keymap = vim.keymap
		hop.setup({})

		local directions = require("hop.hint").HintDirection

		-- easymotion-like motions on the current line
		keymap.set("", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })
		keymap.set("", "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })
		keymap.set("", "t", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, { remap = true })
		keymap.set("", "T", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, { remap = true })

		keymap.set("", "s", function()
			hop.hint_patterns({ direction = directions.AFTER_CURSOR, current_line_only = false })
		end, { remap = false })

		keymap.set("", "S", function()
			hop.hint_patterns({ direction = directions.BEFORE_CURSOR, current_line_only = false })
		end, { remap = false })
	end,
}
