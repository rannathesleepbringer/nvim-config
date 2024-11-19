-- lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      --change the loaded theme here
      opts = { colorscheme = "catppuccin" },
    },
    -- import/override with your plugins
    -- { import = "plugins" },
    --comment out any plugin you dont want. Uncomment above if you want to import all plugins
    require("plugins.kickstart.debug"),
    require("plugins.kickstart.indent_line"),
    require("plugins.kickstart.lint"),
    require("plugins.kickstart.autopairs"),
    -- require("plugins.kickstart.neo-tree"),
    require("plugins.kickstart.gitsigns"), -- adds gitsigns recommend keymaps

    require("plugins.kickstart.autoformat"),
    require("plugins.kickstart.conform"),
    require("plugins.kickstart.lazydev"),
    require("plugins.kickstart.lint"),
    require("plugins.kickstart.luvit-meta"),
    require("plugins.kickstart.mini-nvim"),
    require("plugins.kickstart.nvim-cmp"),
    require("plugins.kickstart.nvim-lspconfig"),
    require("plugins.kickstart.nvim-treesitter"),
    require("plugins.kickstart.telescope"),
    require("plugins.kickstart.todo-comments"),
    require("plugins.kickstart.tokyonight"),
    require("plugins.kickstart.vim-sleuth"),
    require("plugins.kickstart.which-key"),
    --
    -- require("custom.plugins.init"),
    require("plugins.custom.alpha"),
    require("plugins.custom.bufferline"),
    require("plugins.custom.catppuccin"),
    require("plugins.custom.codeium"),
    require("plugins.custom.codesnap"),
    require("plugins.custom.dashboard"),
    require("plugins.custom.flash"),
    require("plugins.custom.gitgraph"),
    require("plugins.custom.harpoon2"),
    require("plugins.custom.lazygit"),
    require("plugins.custom.lualine"),
    require("plugins.custom.luarocks"),
    require("plugins.custom.markview"),
    require("plugins.custom.neogit"),
    require("plugins.custom.neorg"),
    require("plugins.custom.neo-tree"),
    require("plugins.custom.noice"),
    require("plugins.custom.persistence"),
    require("plugins.custom.project"),
    require("plugins.custom.trouble"),
    require("plugins.custom.vimbegood"),

    -- require("plugins.custom.lazyvim"),
    -- require("plugins.custom.nonels"),
    -- require("plugins.custom.notify"),
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },

  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
