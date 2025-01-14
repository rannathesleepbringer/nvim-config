-- codesnap.lua
local M = {

  -- `cond` is a condition used to determine whether this plugin should be
  -- installed and loaded.
  cond = function()
    return vim.fn.executable("rustup") == 1
  end,
  "mistricky/codesnap.nvim",
  -- build = "make build_generator",
  build = "make",
  lazy = false,
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = { "v", "x" }, desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = { "v", "x" }, desc = "Save selected code snapshot in ~/Pictures" },
  },
  -- opts = {
  --   save_path = "~/Pictures",
  --   has_breadcrumbs = true,
  -- },
}

function M.config()
  require("codesnap").setup({
    mac_window_bar = true,
    -- title = "CodeSnap.nvim",
    code_font_family = "JetBrainsMonoNL Nerd Font",
    watermark_font_family = "Pacifico",
    -- watermark = "CodeSnap.nvim",
    -- bg_theme = "default",
    breadcrumbs_separator = "/",
    has_breadcrumbs = false,
    has_line_number = false,
    show_workspace = false,
    min_width = 0,
    bg_padding = 0,
    -- bg_x_padding = 122,
    -- bg_y_padding = 82,
    save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME") .. "/Pictures"),
  })
end
return M
