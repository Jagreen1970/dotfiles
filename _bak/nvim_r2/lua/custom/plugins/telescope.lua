return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"ThePrimeagen/harpoon",
		"tpope/vim-fugitive",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("harpoon")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] find existing buffers" })
		keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind existing [B]uffers" })
		keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
		keymap.set(
			"n",
			"<leader>fr",
			require("telescope.builtin").oldfiles,
			{ desc = "[F]ind [R]ecently opened files" }
		)
		keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind via [G]rep" })
		keymap.set("n", "<leader>fs", require("telescope.builtin").grep_string, { desc = "[F]ind [S]tring" })
		keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind in [H]elp" })
		keymap.set("n", "<leader>fm", "<cmd>Telescope harpoon marks<CR>", { desc = "[F]ind in harpoon [M]arks" })
		keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind in [D]iagnostics" })
		keymap.set("n", "<leader>fc", require("telescope.builtin").resume, { desc = "[F]ind [C]ontinue" })

		-- See `:help telescope.builtin`
		keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
