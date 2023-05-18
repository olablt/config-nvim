
require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
	use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} }
	use { 'nvim-treesitter/nvim-treesitter-context'}
	use { 'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'machakann/vim-highlightedyank'}

    use {'iamcco/markdown-preview.nvim'}

    use {'tpope/vim-commentary'}

    use {'junegunn/goyo.vim'}

    -- golang toolset
    use {'fatih/vim-go'}

    -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    -- use {'fhill2/telescope-ultisnips.nvim'}

    use {'https://github.com/junegunn/fzf'}
    use {'https://github.com/junegunn/fzf.vim'}


    -- autopairs
    use { "windwp/nvim-autopairs" }

    -- -- use { "zbirenbaum/copilot.lua" }
    -- use {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({})
    --     end,
    -- }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},
            ---- " For ultisnips users.
            {'SirVer/ultisnips'},
            {'quangnguyen30192/cmp-nvim-ultisnips'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            -- {'rafamadriz/friendly-snippets'},
        },
}

end)

