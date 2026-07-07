return {
	"neovim-treesitter/nvim-treesitter",
	dependencies = { "neovim-treesitter/treesitter-parser-registry" },
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- 1. Setup the core plugin
		require("nvim-treesitter").setup()

		-- 2. Install your chosen language parsers
		require("nvim-treesitter").install({
			"lua",
			"python",
			"dockerfile",
			"vim",
			"vimdoc",
			"bash",
			"diff",
			"luadoc",
		})

		-- 3. Core runtime configuration via Autocommands
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "lua", "python", "dockerfile", "vim", "bash", "diff" },
			callback = function()
				-- Enables syntax highlighting & activates textobjects matching
				vim.treesitter.start()

				-- Enables Tree-sitter powered indentation
				vim.bo.indentexpr = "v:lua.vim.treesitter.foldexpr()"

				-- Enables Tree-sitter powered code folding
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
