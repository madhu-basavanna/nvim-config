return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap-python",
	},
	branch = "regexp",
	lazy = false,
	opts = {
		settings = {
			options = {
				picker = "snacks", -- Use snacks picker
				notify_user_on_venv_activation = true,
				picker_options = {
					snacks = {
						layout = { preset = "select" },
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>pv",
			"<cmd>VenvSelect<cr>",
			desc = "[P]ython: Select [V]irtual Environment",
		},
	},
}
