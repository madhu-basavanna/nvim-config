return {
	"folke/tokyonight.nvim",
	lazy = false,
	enabled = false,
	priority = 1000,
	-- looad the colorscheme here
	config = function()
		require("tokyonight").setup({
			style = "night", -- Use "day" for the light variant
			-- other config options here if needed
		})
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}
