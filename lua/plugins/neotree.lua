return {
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch="v2.x",
        dependencies={
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            local neotree = require("neo-tree")
            neotree.setup()
            vim.keymap.set("n", "<Leader>e", "<Cmd>Neotree focus<Cr>")
            vim.keymap.set("n", "<Leader>b", "<Cmd>Neotree close<Cr>")
        end
    },
    {
	"tpope/vim-fugitive",
    "loctvl842/monokai-pro.nvim",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },

        config = function()
            local map = vim.keymap.set
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
            vim.g.termguicolors=true
            require("bufferline").setup({
                options = {
                    separator_style = "slant"
                }
            })
            --- put ur keymaps here lol
            vim.keymap.set("n", "<Leader><Tab>", "<Cmd>BufferLineCycleNext<Cr>")
            --- vim.keymap.set("n", "<Leader><S-Tab>", "<Cmd>BufferLineCyclePrev<Cr>")
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
		'nvim-lua/plenary.nvim',
		'IllustratedMan-code/telescope-conda.nvim'
		}
    },
    {
        "SmiteshP/nvim-navic",
        dependencies={
            "neovim/nvim-lspconfig"
        }
    },
    {
        "APZelos/blamer.nvim",
    }
}
}
