" https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'zchee/deoplete-go', { 'do': 'make' }

" disable snippets
let g:go_snippet_engine = ""


" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'


" " Run goimports along gofmt on each save     
let g:go_fmt_command = "goimports"
" " Automatically get signature/type info for object under cursor     
" let g:go_auto_type_info = 1

" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)

" autocmd FileType go nmap <Leader>r :!bash go run %<CR>:
map <Leader>d :update<CR>:!bash run.sh %<CR>
autocmd FileType go nmap <Leader>r :!go run %<CR>
autocmd FileType go nmap <Leader>b :!go build %<CR>
autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_functions = 1

" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']

" " autowrite on make
" set autowrite

" au FileType go setlocal omnifunc=go#complete#GocodeComplete
