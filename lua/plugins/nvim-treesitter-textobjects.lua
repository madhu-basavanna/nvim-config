-- ~/.config/nvim/lua/plugins/treesitter-textobjects.lua
return {
	"nvim-treesitter/nvim-treesitter-textobjects",

	-- Make sure the core parser plugin is loaded first
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	-- Load when any buffer that uses treesitter is opened
	event = { "BufReadPost", "BufNewFile" },

	-- **Tell lazy NOT to call the default `setup`**
	config = false,

	-- Provide our own config that forwards the table to the core plugin
	opts = function()
		return {
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ao"] = "@comment.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<c-v>",
					},
					include_surrounding_whitespace = true,
				},

				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
				},
			},
		}
	end,

	-- This is the *only* place we call `setup`
	config = function(_, opts)
		-- The core plugin will merge this into its own config if it has already
		-- been loaded; otherwise we load it now.
		require("nvim-treesitter.configs").setup(opts)
	end,
}
