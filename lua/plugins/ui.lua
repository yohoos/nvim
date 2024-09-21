return {
    -- colorschemes
    {   'nordtheme/vim', name = "nord"    },
    {   'sainnhe/everforest', name = "everforest"   },
    {   
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000
    },
    {   'mhinz/vim-startify'    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },
    {
        'preservim/nerdtree',
        dependencies = {
            'ryanoasis/vim-devicons',
            'Xuyuanp/nerdtree-git-plugin',
            'tiagofumo/vim-nerdtree-syntax-highlight'
        }
    }
}
