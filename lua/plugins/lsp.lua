return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for configuring lsp servers
    {   'neovim/nvim-lspconfig'    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    }
}
