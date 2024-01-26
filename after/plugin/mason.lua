local lsp_zero = require('lsp-zero')

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"lua_ls", "gopls"},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- lua_ls = lua-language-server
