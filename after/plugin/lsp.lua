-- LSP, CMP and MASON configs

local lsp_zero = require('lsp-zero')


-- LSP configuration
lsp_zero.preset('recommended')

-- lua-language-server
lsp_zero.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})




-- LSP Actions
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
-- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
-- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
-- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
-- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
-- lsp_zero.on_attach(function(client, bufnr)

--   local opts = {buffer = bufnr, remap = false}
--   -- LSP key mappings
--   vim.keymap.set("n", "gd", function() vim.lsp_zero.buf.definition() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp_zero.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp_zero.buf.workspace_symbol() end, opts)
--   vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set("n", "<leader>vca", function() vim.lsp_zero.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>vrr", function() vim.lsp_zero.buf.references() end, opts)
--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp_zero.buf.rename() end, opts)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp_zero.buf.signature_help() end, opts)
-- end)


lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
-- lsp_zero.set_sign_icons({
--   error = '✘',
--   warn = '▲',
--   hint = '⚑',
--   info = '»'
-- })




-- nvim-cmp and luasnip configuration

local cmp = require("cmp")
-- local cmp_action = require('lsp-zero').cmp_action()
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- cmp.setup({
--     window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--     },
--     mapping = cmp.mapping.preset.insert({
--     -- Ctrl+Space to trigger completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     ['<Tab>'] = nil,
--     ['<S-Tab>'] = nil,
--     -- instead of firing ultisnip it is scrolling the suggestions
--     -- ['<Tab>'] = function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_next_item()
--     --   else
--     --     fallback()
--     --   end
--     -- end
--     -- Navigate between snippet placeholder
--     -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--     -- Scroll up and down in the completion documentation
--     -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     -- ['<C-d>'] = cmp.mapping.scroll_docs(4),
--     })
-- })


-- ultisnips
-- example from https://github.com/quangnguyen30192/cmp-nvim-ultisnips
require("cmp_nvim_ultisnips").setup{}
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
cmp.setup({
    preselect = cmp.PreselectMode.None, -- prevent auto selection
    -- completion = {
    --     completeopt = "menu,menuone,noinsert,noselect",
    -- },
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    sources = {
        -- { name = "ultisnips" },
        -- more sources
		{ name = "ultisnips", priority = 90 },
        { name = "nvim_lsp", priority = 2 },
		-- { name = "copilot", priority = 2 },
		{ name = "buffer", keyword_length = 3, priority = 1 },
		-- { name = "luasnip" },
		{ name = "path" },

    },
    -- recommended configuration for <Tab> people:
    mapping = {
        ["<Tab>"] = cmp.mapping(
        function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        end,
        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),

        ["<S-Tab>"] = cmp.mapping(
        function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
        end,
        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),

        -- If nothing is selected (including preselections) add a newline as usual.
        -- If something has explicitly been selected by the user, select it.
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),

    },
})

-- RICH EXAMPLE
-- https://github.com/Aumnescio/dotfiles/blob/36a02fc60af63f8b30e4e2c54dd0c30171f1cf9a/nvim/init.lua#L736


-- -- /////////////// LONG CMP CONFIG
-- local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- local cmp = require('cmp')
-- cmp.setup {
--     snippet = {
--         expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
--     },
--     -- ... Your other configuration ...
--     mapping = {
--         ["<Tab>"] = cmp.mapping({
--             c = function()
--                 if cmp.visible() then
--                     cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
--                 else
--                     cmp.complete()
--                 end
--             end,
--             -- . If the next option was a snippet it would expand the snippet. https://github.com/hrsh7th/nvim-cmp/issues/750
--             i = function(_)--fallback)
--                 if cmp.visible() then
--                     cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
--                 elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
--                     vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
--                 else
--                     -- fallback()
--                     vim.api.nvim_feedkeys(t('<Tab>'), 'n', true)
--                 end
--             end,
--             s = function(fallback)
--                 if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
--                     vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
--                 else
--                     fallback()
--                 end
--             end
--         }),
--         ["<S-Tab>"] = cmp.mapping({
--             c = function()
--                 if cmp.visible() then
--                     cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
--                 else
--                     cmp.complete()
--                 end
--             end,
--             i = function(fallback)
--                 if cmp.visible() then
--                     cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
--                 elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
--                     return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
--                 else
--                     fallback()
--                 end
--             end,
--             s = function(fallback)
--                 if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
--                     return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
--                 else
--                     fallback()
--                 end
--             end
--         }),
--         ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
--         ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
--         ['<C-n>'] = cmp.mapping({
--             c = function()
--                 if cmp.visible() then
--                     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--                 else
--                     vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
--                 end
--             end,
--             i = function(fallback)
--                 if cmp.visible() then
--                     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--                 else
--                     fallback()
--                 end
--             end
--         }),
--         ['<C-p>'] = cmp.mapping({
--             c = function()
--                 if cmp.visible() then
--                     cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
--                 else
--                     vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
--                 end
--             end,
--             i = function(fallback)
--                 if cmp.visible() then
--                     cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
--                 else
--                     fallback()
--                 end
--             end
--         }),
--         ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
--         ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
--         ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
--         ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
--         -- ['<CR>'] = cmp.mapping({
--         --     i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
--         --     c = function(fallback)
--         --         if cmp.visible() then
--         --             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
--         --         else
--         --             fallback()
--         --         end
--         --     end
--         -- }),
--         -- If nothing is selected (including preselections) add a newline as usual.
--         -- If something has explicitly been selected by the user, select it.
--         ["<CR>"] = cmp.mapping({
--             i = function(fallback)
--                 if cmp.visible() and cmp.get_active_entry() then
--                     cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
--                 else
--                     fallback()
--                 end
--             end,
--             s = cmp.mapping.confirm({ select = true }),
--             c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
--         }),
--         -- ... Your other configuration ...
--     },
--    -- ... Your other configuration ...
-- }
-- -- /////////////// END LONG CMP



-- -- //////////////// even older stuff
-- cmp.setup({
-- 	sources = cmp.config.sources({
--         { name = "nvim_lsp", priority = 2 },
-- 		{ name = "ultisnips", priority = 90 },
-- 		{ name = "copilot", priority = 2 },
-- 		{ name = "buffer", keyword_length = 3, priority = 1 },
-- 		{ name = "luasnip" },
-- 		{ name = "path" },
-- 	}),
-- })

-- vim.diagnostic.config({
--     virtual_text = true
-- })


lsp_zero.setup()
