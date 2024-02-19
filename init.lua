require("os")

-- python env
-- vim.g.python3_host_prog='C:\\Users\\cjyou\\anaconda3\\envs\\superautopetsim\\python.exe'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
-- vim.opt.colorcolumn = "79"
vim.cmd("highlight clear SignColumn")

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
-- vim.o.guifont = "Hack Nerd Font Mono"
vim.g.mapleader = " "

vim.opt.updatetime = 750

local map = vim.keymap.set
map("t", "<Esc>", "<C-Bslash><C-n>")
map("n", "<leader>t", ":term<Cr>i")
map("n", "<leader>ff", ":Telescope<Cr>")
map("n", "<leader>g", ":Git<Cr>")
map("n", "<leader>s", ":w<Cr>")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("n", "<leader>w", ":bd<Cr>")
map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>m", "`")
map("n", "<leader>`", "<C-w>w")

-- vim.g.clipboard = {
--   name = 'win32yank',
--   copy = {
--     ["+"] = 'win32yank.exe -i --crlf',
--     ["*"] = 'win32yank.exe -i --crlf',
--   },
--   paste = {
--     ["+"] = 'win32yank.exe -o --lf',
--     ["*"] = 'win32yank.exe -o --lf',
--   },
--   cache_enabled = 0,
-- } 
--
vim.opt.clipboard = "unnamedplus"


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


require("lazy").setup("plugins")
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.cmd.colorscheme('monokai-pro-octogon')
-- vim.cmd.colorscheme('default')
