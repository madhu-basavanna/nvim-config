return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"c",
				"lua",
				"python",
				"dockerfile",
				"vim",
				"vimdoc",
				"bash",
				"diff",
				"html",
				"luadoc",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})
	end,
}
