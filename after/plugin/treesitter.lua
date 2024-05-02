require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    -- ensure_installed = { "help", "javascript", "typescript", "go", "c", "lua", "rust" },
    -- ensure_installed = { "help", "javascript", "typescript", "go", "lua", "php" },
    ensure_installed = { "javascript", "typescript", "go", "lua", "php", "vim", "markdown", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- disable = { "php", "pine", "psl" },
        disable = function(lang, bufnr) -- Disable in large C++ buffers
            return vim.api.nvim_buf_line_count(bufnr) > 50000
            -- return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 50000
        end,


        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- additional_vim_regex_highlighting = false,
        additional_vim_regex_highlighting = {'markdown'},
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            -- init_selection = "gnn", -- set to `false` to disable one of the mappings
            -- node_incremental = "grn",
            -- scope_incremental = "grc",
            -- node_decremental = "grm",
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
}
