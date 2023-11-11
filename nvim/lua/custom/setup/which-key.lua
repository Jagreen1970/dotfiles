-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- document existing key chains
require("which-key").register({
	["<leader>p"] = { name = "[P]revious...", _ = "which_key_ignore" },
	["<leader>n"] = { name = "[N]ext...", _ = "which_key_ignore" },
	["<leader>t"] = { name = "[T]abs and terminals", _ = "which_key_ignore" },
	["<leader>e"] = { name = "[E]xplore Project", _ = "which_key_ignore" },
	["<leader>h"] = { name = "[H]arpoon Marks", _ = "which_key_ignore" },
	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
	["<leader>r"] = { name = "[R]efactoring", _ = "which_key_ignore" },
	["<leader>s"] = { name = "Window [S]plits", _ = "which_key_ignore" },
	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
	["<leader>f"] = { name = "[F]uzzy-Find", _ = "which_key_ignore" },
})
