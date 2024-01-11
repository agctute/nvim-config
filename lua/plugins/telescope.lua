return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                              , branch = '0.1.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'IllustratedMan-code/telescope-conda.nvim'
        },
        config = function()
            local tele = require('telescope')
            local builtin = require('telescope.builtin')
            tele.setup({
              -- extensions = {
              --     conda = {anaconda_path = "C:\\Users\\cjyou\\anaconda3\\"},
              -- }
            })
            -- vim.keymap.set("n", "<Leader>pp", "<Cmd>lua require'telescope'.extensions.conda.conda{}<Cr>")
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    },
}
