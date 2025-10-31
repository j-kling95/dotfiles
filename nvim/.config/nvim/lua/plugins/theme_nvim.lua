return {
	'catppuccin/nvim';
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("catppuccin").setup({
			flavor = mocha
		})
	end,
}
