local toggleterm = require("toggleterm")

toggleterm.setup({})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	name = "lazygit",
	cmd = "lazygit",
	direction = "float",
	floatops = {
		border = "single",
	},
	hidden = true,
})

local _lazygit_toggle = function()
	lazygit:toggle()
end

vim.keymap.set("n", "<leader>tg", _lazygit_toggle, { noremap = true, silent = true, desc = "toggle lazy[G]it" })
vim.keymap.set(
	"n",
	"<leader>tv",
	"<cmd>ToggleTerm size=80 direction=vertical<cr>",
	{ noremap = true, silent = true, desc = "toggle [V]ertical Terminal" }
)
vim.keymap.set(
	"n",
	"<leader>th",
	"<cmd>ToggleTerm size=15 direction=horizontal<cr>",
	{ noremap = true, silent = true, desc = "toggle [H]orizontal Terminal" }
)
vim.keymap.set(
	"n",
	"<leader>tf",
	"<cmd>ToggleTerm direction=float<cr>",
	{ noremap = true, silent = true, desc = "toggle [F]loating Terminal" }
)
