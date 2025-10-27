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

-- Basic buffer close
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
keymap("n", "<leader>bD", "<cmd>bd!<cr>", { desc = "Force delete buffer" })

-- Close buffer but keep window (open alternate file)
keymap("n", "<leader>bq", "<cmd>bp|bd #<cr>", { desc = "Close buffer keep window" })

-- Stay in visual mode after indent
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })
keymap("v", "<", "<gv", { desc = "Indent left and reselect" })

-- Tab/shift-tab for indenting in visual mode
keymap("v", "<Tab>", ">gv", { desc = "Indent right" })
keymap("v", "<S-Tab>", "<gv", { desc = "Indent left" })
