return {
	"echasnovski/mini.nvim",
	version = "*",
	lazy = false,
	config = function()
		require("mini.bufremove").setup({})
		require("mini.indentscope").setup({})
		require("mini.tabline").setup({
			show_icons = false,
			tabpage_section = "right",
		})
		require("mini.statusline").setup({
			use_icons = false,
		})
	end,
}
