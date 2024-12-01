return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 20,
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,
		})
		-- horizontal split
		vim.api.nvim_set_keymap(
			"n",
			"<leader>th",
			"<cmd>lua require('toggleterm').exec('horizontal')<CR>",
			{ noremap = true, silent = true }
		)
		-- vertical split
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tv",
			"<cmd>lua require('toggleterm').exec('vertical')<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
