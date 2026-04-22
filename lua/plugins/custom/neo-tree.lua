-- neotree filetree.lua neo-tree
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
local M = {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
}
function M.config()
  require("neo-tree").setup({
    close_if_last_window = true,
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },

    vim.keymap.set("n", "<leader>ee", "<Cmd>Neotree reveal<CR>"),
    vim.keymap.set("n", "<leader>ec", "<Cmd>Neotree ~/.config/nvim/<CR>"),
  })
end
return M
