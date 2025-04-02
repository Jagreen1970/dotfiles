-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection down" }) -- move selection down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection up" }) -- move selection up

keymap.set("n", "J", "mzJ`z", { desc = "Join next line with cursor in place" }) -- join next line

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "jump half a page down, keep cursor centered" }) -- jump half a page down
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "jump half a page up, keep cursor centered" }) -- jump half a page up
keymap.set("n", "n", "nzzzv", { desc = "next result, keep cursor centered" }) -- next result
keymap.set("n", "N", "Nzzzv", { desc = "previous result, keep cursor centered" }) -- previous result

-- pasting while deleting into the void register -> paste-register still contains the original value
-- keymap.set("x", "<leader>p", [["_dP]])
-- keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "Q", "<nop>")

-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Buffer" })

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set(
	"n",
	"<leader>rr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace text in buffer" }
)
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
