-- codeium.lua

-- return {
-- 	"Exafunction/codeium.vim",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"hrsh7th/nvim-cmp",
-- 	},
-- 	config = function()
-- 		require("codeium").setup({
-- 			enable_chat = true,
-- 		})
-- 		-- Change '<C-g>' here to any keycode you like.
-- 			vim.keymap.set("i", "<C-g>", function()
-- 				return vim.fn["codeium#Accept"]()
-- 			end, { expr = true, silent = true })
-- 			vim.keymap.set("i", "<c-;>", function()
-- 				return vim.fn["codeium#CycleCompletions"](1)
-- 			end, { expr = true, silent = true })
-- 			vim.keymap.set("i", "<c-,>", function()
-- 				return vim.fn["codeium#CycleCompletions"](-1)
-- 			end, { expr = true, silent = true })
-- 			vim.keymap.set("i", "<c-x>", function()
-- 				return vim.fn["codeium#Clear"]()
-- 			end, { expr = true, silent = true })
-- 	end,
-- }

local M = {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({ enable_chat = true })
	end,
}
return M
