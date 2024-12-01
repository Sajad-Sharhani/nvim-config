vim.opt.expandtab = true -- Convert tabs to spaces.
vim.opt.tabstop = 2 -- A tab is two spaces.
vim.opt.softtabstop = 2 -- Pressing Tab inserts two spaces.
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard.
vim.opt.colorcolumn = "100" -- Line length marker at 100 characters.
vim.opt.number = true -- Show line numbers.
vim.g.mapleader = " " -- Space as the leader key.
vim.opt.relativenumber = true --relative line numbers-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Mappings to move lines up and down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move the current line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move the current line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move the selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move the selected lines up" })

-- Move to previous/next tab
vim.keymap.set("n", "<A-,>", "<cmd>BufferPrevious<CR>", { desc = "Move to previous buffer" })
vim.keymap.set("n", "<A-.>", "<cmd>BufferNext<CR>", { desc = "Move to next buffer" })

-- Reorder tabs
vim.keymap.set("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", { desc = "Move current buffer to previous position" })
vim.keymap.set("n", "<A->>", "<cmd>BufferMoveNext<CR>", { desc = "Move current buffer to next position" })

-- Close buffer
vim.keymap.set("n", "<A-c>", "<cmd>BufferClose<CR>", { desc = "Close current buffer" })
-- Restore buffer
vim.keymap.set("n", "<A-s-c>", "<cmd>BufferRestore<CR>", { desc = "Restore closed buffer" })

-- Sort automatically by ...
vim.keymap.set("n", "<leader>bb", "<cmd>BufferOrderByBufferNumber<CR>", { desc = "Sort by buffer number" })
vim.keymap.set("n", "<leader>bd", "<cmd>BufferOrderByDirectory<CR>", { desc = "Sort by directory" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferOrderByLanguage<CR>", { desc = "Sort by language" })
vim.keymap.set("n", "<leader>bn", "<cmd>BufferOrderByName<CR>", { desc = "Sort by name" })
vim.keymap.set("n", "<leader>bw", "<cmd>BufferOrderByWindowNumber<CR>", { desc = "Sort by window number" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
-- save keybindings
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- Trim whitespace and ensure a single newline at the end on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local save = vim.fn.winsaveview()
		-- Remove trailing whitespace
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		-- Ensure exactly one newline at the end of the file
		vim.cmd([[silent! %s/\(\n\|\%$\)\@<!\%$/\r/e]])
		vim.fn.winrestview(save)
	end,
})
