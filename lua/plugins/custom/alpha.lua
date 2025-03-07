-- alpha.lua
local M = {
  "goolord/alpha-nvim",
  dependencies = { "folke/which-key.nvim" },
  event = "VimEnter",
}
local function set_dashboard_logo()
  if vim.g.scarlet then
    local logo = {
      [[  ██████  ▄████▄   ▄▄▄       ██▀███   ██▓    ▓█████▄▄▄█████▓    ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓]],
      [[▒██    ▒ ▒██▀ ▀█  ▒████▄    ▓██ ▒ ██▒▓██▒    ▓█   ▀▓  ██▒ ▓▒    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
      [[░ ▓██▄   ▒▓█    ▄ ▒██  ▀█▄  ▓██ ░▄█ ▒▒██░    ▒███  ▒ ▓██░ ▒░   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░]],
      [[  ▒   ██▒▒▓▓▄ ▄██▒░██▄▄▄▄██ ▒██▀▀█▄  ▒██░    ▒▓█  ▄░ ▓██▓ ░    ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ ]],
      [[▒██████▒▒▒ ▓███▀ ░ ▓█   ▓██▒░██▓ ▒██▒░██████▒░▒████▒ ▒██▒ ░    ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒]],
      [[▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░▓  ░░░ ▒░ ░ ▒ ░░      ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░]],
      [[░ ░▒  ░ ░  ░  ▒     ▒   ▒▒ ░  ░▒ ░ ▒░░ ░ ▒  ░ ░ ░  ░   ░       ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░]],
      [[░  ░  ░  ░          ░   ▒     ░░   ░   ░ ░      ░    ░            ░   ░ ░     ░░   ▒ ░░      ░   ]],
      [[      ░  ░ ░            ░  ░   ░         ░  ░   ░  ░                    ░      ░   ░         ░   ]],
      [[         ░                                                                    ░                  ]],
    }
    local color = "ScarletNvimDashboardLogo1"
    return logo, color
  else
    local logo = {
      [[          ▄▄                              ▄▄			    ]],
      [[        ▀███                            ▀███                        ]],
      [[          ██                              ██			    ]],
      [[ ▄██▀███  ██   ▄▄█▀██  ▄▄█▀██▀████████▄   ██   ▄▄█▀██ ▄██▀███▄██▀███]],
      [[ ██   ▀▀  ██  ▄█▀   ██▄█▀   ██ ██   ▀██   ██  ▄█▀   ████   ▀▀██   ▀▀]],
      [[ ▀█████▄  ██  ██▀▀▀▀▀▀██▀▀▀▀▀▀ ██    ██   ██  ██▀▀▀▀▀▀▀█████▄▀█████▄]],
      [[ █▄   ██  ██  ██▄    ▄██▄    ▄ ██   ▄██   ██  ██▄    ▄█▄   ███▄   ██]],
      [[ ██████▀▄████▄ ▀█████▀ ▀█████▀ ██████▀  ▄████▄ ▀█████▀██████▀██████▀]],
      [[                               ██                                   ]],
      [[                             ▄████▄                                 ]],
    }
    local color = "RannaNvimDashboardLogo"
    return logo, color
  end
end

local function reset_logo_hls()
  -- Reference:
  -- https://github.com/sei40kr/yonvim/blob/5ccd00611573a3291304666902746e7d08b53d21/lua/yvim/plugins/alpha-nvim.lua#L10
  local red = vim.g.terminal_color_1
  local pink = vim.g.terminal_color_5
  local purple = vim.g.terminal_color_13
  local gray = vim.api.nvim_get_hl(0, { name = "Comment" }).fg

  vim.api.nvim_set_hl(0, "ScarletNvimDashboardLogo1", { fg = red })
  vim.api.nvim_set_hl(0, "RannaNvimDashboardLogo", { fg = purple })
  vim.api.nvim_set_hl(0, "ScarletNvimDashboardLogo2", { fg = pink })
  vim.api.nvim_set_hl(0, "ScarletNvimDashboardLogo3", { fg = red, bg = pink })
  vim.api.nvim_set_hl(0, "ScarletNvimDashboardFooter", { fg = gray })
end

local function restore_session()
  require("persistence").load()
end
function M.config()
  local dashboard = require("alpha.themes.dashboard")
  local icons = require("config.icons")

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Include"
    return b
  end

  reset_logo_hls()

  dashboard.section.header.val, dashboard.section.header.opts.hl = set_dashboard_logo()

  dashboard.section.buttons.val = {
    button("f", icons.ui.Files .. "  Find file", ":Telescope find_files <CR>"),
    button("n", icons.ui.NewFile .. "  New file", "<cmd>enew<CR>"),
    button("p", icons.git.Repo .. "  Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    button("h", icons.ui.History .. "  Recent Files", "<cmd>Telescope oldfiles<cr>"),
    button("e", icons.ui.Tree .. "   Explorer", "<cmd>Neotree dir=./~<cr>"),
    button("t", icons.ui.Text .. "  Find text", ":Telescope live_grep <CR>"),
    button("c", icons.ui.Gear .. "  Open Config", ":Telescope live_grep search_dirs=~/.config/nvim/<CR>"),
    button("r", icons.ui.History .. "  Restore Session", restore_session),
    button("l", "󰒲   Lazy", "<cmd>Lazy<CR>"),
    -- button("x", icons.ui.Code .. "   Lazy Extras", "<cmd>LazyExtras<CR>"),
    button("m", icons.ui.Scopes .. "   Mason", "<cmd>Mason<CR>"),
    button("q", icons.ui.SignOut .. "  Quit", ":qa<CR>"),
  }
  local function footer()
    return "Scarlet Nvim"
  end

  dashboard.section.footer.val = footer()

  -- dashboard.section.header.opts.hl = "Keyword"
  -- dashboard.section.header.opts.hl = "ScarletNvimDashboardLogo1"
  -- dashboard.section.header.opts.hl = {
  --   { { "ScarletNvimDashboardLogo1", 0, 9999 } },
  --   { { "ScarletNvimDashboardLogo1", 6, 14 }, { "ScarletNvimDashboardLogo2", 15, 23 } },
  --   { { "ScarletNvimDashboardLogo1", 7, 9 }, { "ScarletNvimDashboardLogo3", 10, 12 }, { "ScarletNvimDashboardLogo2", 13, 18 } },
  --   { { "ScarletNvimDashboardLogo2", 0, 9999 } },
  --   { { "ScarletNvimDashboardLogo2", 0, 9999 } },
  --   {},
  --   {},
  -- }
  dashboard.section.buttons.opts.hl = "Include"
  dashboard.section.footer.opts.hl = "Type"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  local wk = require("which-key")
  wk.add({
    { "<leader>a", "<cmd>Alpha<cr>", desc = "Dashboard", mode = "n" },
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
    end,
  })
end

return M
