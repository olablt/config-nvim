
require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} }
	use { 'nvim-treesitter/nvim-treesitter-context'}
	use { 'nvim-treesitter/nvim-treesitter-textobjects'}
    -- color schemes
    use { 'mhartington/oceanic-next' }
    use { 'christianchiarulli/nvcode-color-schemes.vim' }
	use { 'whatyouhide/vim-gotham' } -- ??

    use {'machakann/vim-highlightedyank'}


    use {'tpope/vim-commentary'}

    use {'junegunn/goyo.vim'}

    -- golang toolset
    use {'fatih/vim-go'}

    use {'https://github.com/junegunn/fzf'}
    use {'https://github.com/junegunn/fzf.vim'}


    -- autopairs
    use { "windwp/nvim-autopairs" }

    -- use({
    --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --     config = function()
    --         require("lsp_lines").setup()
    --     end,
    -- })

    -- -- within packer init {{{
    --     use {'SirVer/ultisnips',
    --     requires = {{'honza/vim-snippets', rtp = '.'}} -- snipMate & UltiSnip Snippets collection
    --     ,
    --     config = function()
    --         vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
    --         vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
    --         vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
    --         vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
    --         vim.g.UltiSnipsRemoveSelectModeMappings = 0
    --     end
    -- }
    -- -- }}}

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

    -- use {'iamcco/markdown-preview.nvim'}
	-- use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }

end)

