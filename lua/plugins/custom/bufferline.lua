-- bufferline.lua
local M = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
}
function M.config()
  require("bufferline").setup({
    options = {
      separator_style = "slant",
    },
  })
end
return M
