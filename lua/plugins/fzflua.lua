return {
	"ibhagwan/fzf-lua",
	enabled = false,
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files in project directory",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find by grepping in project directory",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in neovim configuration",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind current [W]ord",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "[F]ind current [W]ORD",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[,] Find existing buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Live grep the current buffer",
		},
	},
}
