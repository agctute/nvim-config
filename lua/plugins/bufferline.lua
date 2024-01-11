return {
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        config = function()
            vim.g.termguicolors=true
            require("bufferline").setup({
                options = {
                  indicator = {
                    icon = '| ',
                    style = 'none'
                  }
                }
            })
            --- put ur keymaps here lol
            vim.keymap.set("n", "<Leader><Tab>", "<Cmd>BufferLineCycleNext<Cr>")
            vim.keymap.set("n", "<Leader><Leader><Tab>", "<Cmd>BufferLineCyclePrev<Cr>")
        end
    },
}
