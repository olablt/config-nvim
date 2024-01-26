" https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets

" disable snippets
let g:go_snippet_engine = ""
" " Run goimports along gofmt on each save     
let g:go_fmt_command = "goimports"

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" autocmd FileType go nmap <Leader>r :!bash go run %<CR>:
map <Leader>d :update<CR>:!bash run.sh %<CR>
" autocmd FileType go nmap <Leader>r :!go run %<CR>
" autocmd FileType go nmap <Leader>b :!go build %<CR>
autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)
" let g:go_def_mapping_enabled = 0

" " Automatically get signature/type info for object under cursor     
" let g:go_auto_type_info = 1
" let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
