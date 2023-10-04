local lsp = require('lsp-zero')

lsp.preset('recommended')

-- -- Fix Undefined global 'vim'
-- lsp.configure('lua-language-server', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })


-- CMP

local cmp = require("cmp")
-- local luasnip = require("luasnip")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})



lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})





-- //////////////// even older stuff
cmp.setup({
	sources = cmp.config.sources({
        { name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "copilot" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "path" },
	}),
})

--cmp.setup({
--	sources = cmp.config.sources({
--		{ name = "copilot" },
--		{ name = "buffer" },
--		{ name = "luasnip" },
--		{ name = "ultisnips" },
--		{ name = "path" },
--	}),
--	snippet = {
--		expand = function(args)
--			require("luasnip").lsp_expand(args.body)
--		end,
--	},
--	mapping = {
----		["<C-i>"] = cmp.mapping.complete(),
--		["<C-n>"] = cmp.mapping.select_next_item(),
--		["<C-p>"] = cmp.mapping.select_prev_item(),
--		["<C-y>"] = cmp.mapping.confirm({ select = true }),
--        ["<C-Space>"] = cmp.mapping.complete(),
--		-- ["<Tab>"] = cmp.mapping(function(fallback)
--		-- 	if luasnip.expand_or_jumpable() then
--		-- 		luasnip.expand_or_jump()
--		-- 	else
--		-- 		fallback()
--		-- 	end
--		-- end, { "i", "s" }),
--	},
--})




-- ////////////////////////////////// old stuff
-- https://www.getman.io/posts/programming-go-in-neovim/

--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--  ["<C-Space>"] = cmp.mapping.complete(),
--})


-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })


-- lsp.on_attach(function(client, bufnr)
-- 	local opts = {buffer = bufnr, remap = false}
-- 	if client.name == "eslint" then
-- 		vim.cmd.LspStop('eslint')
-- 		return
-- 	end
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
-- 	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
-- 	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
-- 	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
-- 	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
-- 	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
-- 	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
-- 	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)


