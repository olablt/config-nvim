" 

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" " Plug 'pbogut/fzf-mru.vim'
" Plug 'junegunn/fzf.vim'

" command! -bang Buffers
  " \ call fzf#vim#buffers({'left': '30%'}, <bang>0)

" command! -bang Colors
  " \ call fzf#vim#colors({'left': '20%'}, <bang>0)

" let g:fzf_layout = { 'down': '~40%' }

let $FZF_DEFAULT_COMMAND = 'rg --files'
" let $FZF_DEFAULT_COMMAND = 'rg --files --no-hidden'
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" ## Files
nnoremap <silent> <leader>h :History<CR>
" nnoremap <silent> <leader>m :FZFMru<CR>
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>g :GFiles --cached --others --exclude-standard<CR>
nnoremap <silent> <leader>p :Ag<CR>

" ## Rg search
nnoremap <leader>rg :Rg<Space>
nnoremap <leader>!  :Rg!<Space>

" ## Tags
nnoremap <silent> <leader>]  :Tags<CR>
nnoremap <silent> <leader>b] :BTags<CR>

" ## Buffers
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>c :Colors<CR>
" nnoremap <silent> ; :Buffers<CR>
nnoremap <silent> <C-b> :Buffers<CR>

" ## Lines
nnoremap <silent> <leader>l :BLines<CR>
" nnoremap <silent> <C-l> :BLines<CR>
" nnoremap <silent> <C-f> :BLines function<CR>
autocmd FileType go :nnoremap <silent> <leader>f :BLines func <CR>
autocmd FileType javascript :nnoremap <silent> <leader>f :BLines function<CR>
autocmd FileType php :nnoremap <silent> <leader>f :BLines function<CR>
autocmd FileType python :nnoremap <silent> <leader>f :BLines def <CR>

" ## Project files
noremap <silent> <leader>ec :Files app/app-mvc/controllers<CR>
noremap <silent> <leader>em :Files app/app-mvc/models<CR>
noremap <silent> <leader>ev :Files app/app-mvc/views<CR>

" ## Sibling files
nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>
" nnoremap <silent> <leader>= :Rg <C-r>=expand("%:h")<CR>/<CR>
" nnoremap <silent> <leader>= :Ag <C-r>=expand("%:h")<CR>/<CR>
" =-


" vim:ft=vim
