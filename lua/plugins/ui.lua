return {
    {   'mhinz/vim-startify'    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },
    {   'sainnhe/everforest', name = "everforest" },
    {   
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}

