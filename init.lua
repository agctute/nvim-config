require("os")

-- python env
-- vim.g.python3_host_prog='C:\\Users\\cjyou\\anaconda3\\envs\\superautopetsim\\python.exe'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.shiftround = true

vim.g.mapleader = " "

local map = vim.keymap.set
map("t", "<Esc>", "<C-Bslash><C-n>:bd!<Cr>")
map("n", "<leader>t", ":term<Cr>i")
map("n", "<leader>ff", ":Telescope<Cr>")
map("n", "<Leader>g", ":Git<Cr>")
map("n", "<Leader>s", ":w<Cr>")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("n", "<Leader>w", ":bd<Cr>")

vim.opt.clipboard = "unnamedplus"

local setup_lsp_keybinds = function()
    map("n", "gD", vim.lsp.buf.declaration, { silent = true, buffer = true })
    map("n", "gd", vim.lsp.buf.definition, { silent = true, buffer = true })
    map("n", "K", vim.lsp.buf.hover, { silent = true, buffer = true })
    map("n", "<Leader>dj", vim.diagnostic.goto_next, { buffer = true })
    map("n", "<Leader>dk", vim.diagnostic.goto_prev, { buffer = true })
    map("n", "<Leader>dl", require("telescope.builtin").diagnostics, { buffer = true })
    map("n", "<Leader>r", require("utils").rename_var, { buffer = true })
    map("n", "<Leader>c", vim.lsp.buf.code_action, { buffer = true })
end

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
vim.cmd.colorscheme("monokai-pro")
