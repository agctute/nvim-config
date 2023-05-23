require("os")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.shiftround = true

-- custom python provider
local conda_prefix = os.getenv("CONDA_PREFIX")
if not conda_prefix == nil then
    vim.g.python_host_prog = conda_prefix .. "/bin/python"
    vim.g.python3_host_prog = conda_prefix .. "/bin/python"
else
    vim.g.python_host_prog = "python"
    vim.g.python3_host_prog = "python3"
end
vim.g.mapleader = " "

local map = vim.keymap.set
map("t", "<Esc>", "<C-Bslash><C-n>:bd!<Cr>")
map("n", "<leader>t", ":term<Cr>i")
map("n", "<leader>ff", ":Telescope<Cr>")
map("n", "<C-g>", ":Git<Cr>")
map("n", "<C-s>", ":w<Cr>")
map("x", "<", "<gv")
map("x", ">", ">gv")

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

require("lazy").setup({
	"tpope/vim-fugitive",
	"rebelot/kanagawa.nvim",
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            extensions = {
                conda = {anaconda_path = "C:\\Users\\cjyou\\anaconda3\\"}
            }
        })
        vim.keymap.set("n", "<Leader>pp", "<Cmd>lua require'telescope'.extensions.conda.conda{}<Cr>")
    end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },

        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({
                on_attach = function()
                    setup_lsp_keybinds()
                end,
            })
            lspconfig.eslint.setup({
                on_attach = function()
                    setup_lsp_keybinds()
                end,
            })
            lspconfig.lua_ls.setup({
                on_attach = function()
                setup_lsp_keybinds()
            end,
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                        diagnostics = {
                            globals = {"vim",}, -- Plenary test suite variables
                        },
                    },
                },
            })
            lspconfig.pyright.setup({
                on_attach = function()
                    setup_lsp_keybinds()
                end,
            })
            lspconfig.tsserver.setup({
                on_attach = function()
                    setup_lsp_keybinds()
                end,
            })

        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        config = function()
            require("bufferline").setup()
            --- put ur keymaps here lol
            vim.keymap.set("n", "<C-Tab>", "<Cmd>BufferLineCycleNext<Cr>")
            vim.keymap.set("n", "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<Cr>")
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-tree").setup({
                --- disable_netrw = false,
                --- hijack_netrw = false,
            })
            vim.keymap.set("n", "<C-e>", "<Cmd>NvimTreeFindFileToggle<Cr>")
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
		'nvim-lua/plenary.nvim',
		'IllustratedMan-code/telescope-conda.nvim'
		}
    }



})

vim.cmd.colorscheme("kanagawa")

