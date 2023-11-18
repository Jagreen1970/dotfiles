-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection down" }) -- move selection down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection up" }) -- move selection up

keymap.set("n", "J", "mzJ`z", { desc = "Join next line with cursor in place" }) -- join next line

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "jump half a page down, keep cursor centered" }) -- jump half a page down
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "jump half a page up, keep cursor centered" }) -- jump half a page up
keymap.set("n", "n", "nzzzv", { desc = "next result, keep cursor centered" }) -- next result
keymap.set("n", "N", "Nzzzv", { desc = "previous result, keep cursor centered" }) -- previous result

keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "Q", "<nop>")
