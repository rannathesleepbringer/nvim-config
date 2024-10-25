-- lazyvim.lua
local M = {

  -- add LazyVim and import its plugins
  {
    {
      "LazyVim/LazyVim",
    },
    import = "lazyvim.plugins",
    opts = { colorscheme = "catppuccin" },
  },
  -- import/override with your plugins
  -- { import = "lazyvim.plugins.extras.lsp.none-ls" },
}

return M
