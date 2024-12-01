return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})

		-- Key mappings
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xx",
			"<cmd>TroubleToggle<cr>",
			{ noremap = true, silent = true, desc = "Trouble: Toggle" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			{ noremap = true, silent = true, desc = "Trouble: Toggle Workspace Diagnostics" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xd",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			{ noremap = true, silent = true, desc = "Trouble: Toggle Document Diagnostics" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xl",
			"<cmd>TroubleToggle loclist<cr>",
			{ noremap = true, silent = true, desc = "Trouble: Toggle Location List" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xq",
			"<cmd>TroubleToggle quickfix<cr>",
			{ noremap = true, silent = true, desc = "Trouble: Toggle Quickfix List" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"gR",
			"<cmd>TroubleToggle lsp_references<cr>",
			{ noremap = true, silent = true, desc = "Trouble: Toggle LSP References" }
		)
	end,
}
