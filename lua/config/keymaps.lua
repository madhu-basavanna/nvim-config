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

-- Visual mode: Search and replace selected text
keymap("v", "<leader>r", function()
	-- Yank the selected text
	vim.cmd('noau normal! "vy"')
	local selected = vim.fn.getreg("v")
	-- Escape special characters for search pattern
	selected = vim.fn.escape(selected, "/\\")
	-- Prompt for replacement text
	local replacement = vim.fn.input("Replace '" .. selected .. "' with: ")
	if replacement ~= "" then
		-- Perform replacement in entire file
		vim.cmd("%s/" .. selected .. "/" .. replacement .. "/g")
	end
end, { desc = "Replace selected text in file" })

-- Alternative: Replace only in visual selection
keymap("v", "<leader>R", function()
	vim.cmd('noau normal! "vy"')
	local selected = vim.fn.getreg("v")
	selected = vim.fn.escape(selected, "/\\")
	local replacement = vim.fn.input("Replace '" .. selected .. "' with (in selection): ")
	if replacement ~= "" then
		-- '<,'> is automatically added for visual range
		vim.cmd("'<,'>s/" .. selected .. "/" .. replacement .. "/g")
	end
end, { desc = "Replace selected text in selection" })

-- Replace only in visual selection (with confirmation)
keymap("v", "<leader>rs", function()
	vim.cmd('noau normal! "vy"')
	local selected = vim.fn.getreg("v")
	selected = vim.fn.escape(selected, "/\\")
	local replacement = vim.fn.input("Replace '" .. selected .. "' with (in selection): ")
	if replacement ~= "" then
		-- '<,'> is automatically added for visual range
		vim.cmd("'<,'>s/" .. selected .. "/" .. replacement .. "/gc")
	end
end, { desc = "Replace selected text in selection (confirm each)" })

-- For post-search replacement with * (normal mode, with confirmation)
keymap("n", "<leader>r", function()
	local replacement = vim.fn.input("Replace search pattern with: ")
	if replacement ~= "" then
		vim.cmd("%s//" .. replacement .. "/gc")
	end
end, { desc = "Replace last search pattern (confirm each)" })

-- For post-search replacement with * (normal mode, replace all)
keymap("n", "<leader>R", function()
	local replacement = vim.fn.input("Replace search pattern with (all): ")
	if replacement ~= "" then
		vim.cmd("%s//" .. replacement .. "/g")
	end
end, { desc = "Replace last search pattern (replace all)" })
