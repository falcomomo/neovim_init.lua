-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


-- Need the line nums and relative linenums
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs, lines, wraps
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Directories etc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--vim.opt.autochdir = true -- make current buffer dir the cwd

-- Case with searches
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.guifont = { "FiraCode Nerd Font Mono:h11" }

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Neovide stuff
if vim.g.neovide then
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_animation_length = 0.12
    vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_cursor_vfx_mode = "railgun"
else
-- Cursor
    vim.opt.guicursor = ""
end
