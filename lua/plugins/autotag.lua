return {
	"windwp/nvim-ts-autotag",
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
