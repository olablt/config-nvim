vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.numberwidth = 3
vim.opt.cmdheight = 2
vim.opt.confirm = true
vim.opt.ff = "unix"

vim.opt.clipboard = 'unnamedplus'


vim.opt.wildmenu = true
vim.opt.wildmode='list:longest,full'
vim.opt.showcmd = true

vim.opt.tabstop = 4 -- length of an actual \t character
vim.opt.softtabstop = -1 -- Indentation
vim.opt.shiftwidth = 0 -- Indentation
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftround = true -- round indent to multiple of shiftwidth
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd('filetype indent on')
vim.cmd('filetype plugin indent on')
vim.cmd('filetype plugin on')
-- :retab -- for reindenting open files


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.cmd("colorscheme gotham")
vim.opt.termguicolors = true
vim.g.nvcode_termcolors = 256
-- vim.g.airline_theme='oceanicnext'
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.history = 50
vim.opt.inccommand = 'split'
-- vim.cmd("nnoremap <silent> <CR> :noh<CR><CR>") -- clear search highlight with enter
vim.cmd("nnoremap <silent> <Esc> :noh<CR>") -- clear search highlight with esc


vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- disable auto comment
vim.cmd(":autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- Automatically read a file that has changed on disk
vim.cmd("set autoread")


-- Remember last cursor position
vim.cmd("autocmd BufReadPost * if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line(\"$\") | exe \"normal! g'\\\"\" | endif")
