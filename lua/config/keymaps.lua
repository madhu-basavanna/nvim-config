local keymap = vim.keymap.set

keymap("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

keymap("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- Save functionality
keymap({ "n", "i" }, "<C-s>", function()
	vim.cmd("w")
end, { desc = "Save file" })

-- Quit functionality
keymap({ "n", "i" }, "<C-q>", function()
	vim.cmd("q")
end, { desc = "Quit Neovim" })

-- Save and quit
keymap({ "n", "i" }, "<C-w>", function()
	vim.cmd("wq")
end, { desc = "Save and quit" })
