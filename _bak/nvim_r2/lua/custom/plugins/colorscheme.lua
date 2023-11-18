return {
	{
		"rose-pine/neovim",
		priority = 1000, -- make sure to load this before all the other start plugins
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				-- variant = "moon",
				dim_nc_background = false,
				disable_background = true,
				disable_float_background = true,
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
