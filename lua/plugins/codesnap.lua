local M = {

	"mistricky/codesnap.nvim",
	lazy = true,
	build = "make",
	config = function()
		require("codesnap").setup({
			mac_window_bar = true,
			save_path = "~/Pictures/nvim-snapshots/codeshot.png",
		})
	end,
}
return M
