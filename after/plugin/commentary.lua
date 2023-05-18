vim.keymap.set("n", "<C-/>", "<Plug>Commentary", { noremap = true })
-- vim.keymap.set("n", "<leader>/", "<Plug>Commentary<cr>", { noremap = true })
vim.keymap.set("n", "<leader>/", "<Plug>CommentaryLine", { noremap = true })
vim.keymap.set("v", "<leader>/", "<Plug>Commentary", { noremap = true })

-- change php file comment style
-- translate to lua: autocmd FileType php set commentstring=//\ %s
vim.cmd("autocmd FileType php set commentstring=//\\ %s")
vim.cmd("autocmd FileType c set commentstring=//\\ %s")


