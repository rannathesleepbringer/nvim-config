-- neorg.lua

local M = {

  -- `cond` is a condition used to determine whether this plugin should be
  -- installed and loaded.
  cond = function()
    return vim.fn.executable("luarocks") ~= 1
  end,
  "nvim-neorg/neorg",
  version = "v7.0.0",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    })

    -- vim.wo.foldlevel = 99
    -- vim.wo.conceallevel = 2
  end,
}

return M
