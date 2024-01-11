return {
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
}
