return {
	"nvim-treesitter/nvim-treesitter-textobjects",

	-- CORRECTED: Points to the new GitHub organization repo for Neovim 0.10+ / 0.12
	dependencies = { "neovim-treesitter/nvim-treesitter" },

	-- Load when any buffer that uses treesitter is opened
	event = { "BufReadPost", "BufNewFile" },

	-- Configuration options for the textobjects extension
	opts = {
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
	},
}
