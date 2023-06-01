return {
{
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local tele = require('telescope')
        tele.setup({
            extensions = {
                conda = {anaconda_path = "C:\\Users\\cjyou\\anaconda3\\"},
            }
        })
        vim.keymap.set("n", "<Leader>pp", "<Cmd>lua require'telescope'.extensions.conda.conda{}<Cr>")
    end
    },
    {
        dir = "C:\\Users\\cjyou\\OneDrive\\Documents\\Projects\\telescope-repo.nvim",
        -- "cljoly/telescope-repo.nvim",
        event = "VeryLazy",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            local tel = require('telescope')
            tel.setup()
            tel.load_extension "repo"
        end
    },
}
