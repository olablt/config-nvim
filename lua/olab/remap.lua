-- mode
--  "n" - normal mode
--  "i" - insert mode
--  "x" - visual mode
--  "v" - visual and select mode
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- preserve register when pasting
map("x", "p", "P")

vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<S-s>", ":%s/", opts)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
-- close current buffer
vim.keymap.set("n", "<S-w>", ":bd<CR>", opts)


-- " ## remap my 'j' and 'k' keys to move down to the next visible line instead
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- Insert --
-- Press jk fast to exit insert mode 
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)


-- go to previous buffer
-- vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)


