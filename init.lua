require("os")

-- python env
-- vim.g.python3_host_prog='C:\\Users\\cjyou\\anaconda3\\envs\\superautopetsim\\python.exe'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.colorcolumn = "79"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.o.guifont = "Hack Nerd Font Mono"

vim.g.mapleader = " "

local map = vim.keymap.set
map("t", "<C-Esc>", "<C-Bslash><C-n>:bd!<Cr>")
map("n", "<leader>t", ":term<Cr>i")
map("n", "<leader>ff", ":Telescope<Cr>")
map("n", "<leader>g", ":Git<Cr>")
map("n", "<leader>s", ":w<Cr>")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("n", "<leader>w", ":bd<Cr>")
map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>m", "`")

vim.opt.clipboard = "unnamedplus"


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.cmd.colorscheme('monokai-pro')
