local keymap = vim.keymap.set

keymap("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

keymap("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- Duplicated key maps for save write and quit since alacritty reads Alt as Esc
-- Alt+s → Save
keymap({ "n", "i" }, "<Esc>s", "<Cmd>w<CR>", { desc = "Save file" })
keymap({ "n", "i" }, "<A-s>", "<Cmd>w<CR>")

-- Alt+q → Quit
keymap({ "n", "i" }, "<Esc>q", "<Cmd>q<CR>", { desc = "Quit Neovim" })
keymap({ "n", "i" }, "<A-q>", "<Cmd>q<CR>")

-- Alt+w → Save + Quit
keymap({ "n", "i" }, "<Esc>w", "<Cmd>wq<CR>", { desc = "Save and quit" })
keymap({ "n", "i" }, "<A-w>", "<Cmd>wq<CR>")

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
