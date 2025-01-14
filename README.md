# nvim-config
lazy.nvim with Kickstart Neovim plugin inspo

## Installation

### Install Neovim
  `pacman -S neovim`
### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)

- [rust](https://rustup.rs/)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- [luarocks](https://github.com/luarocks/luarocks)

- Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.
