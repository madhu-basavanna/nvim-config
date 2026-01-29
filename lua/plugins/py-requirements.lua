return {
	"MeanderingProgrammer/py-requirements.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = "requirements",
	config = function()
		require("py-requirements").setup({})
	end,
}
