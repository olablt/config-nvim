" Remove all existing highlighting.

hi clear
if exists("syntax_on")
    syntax reset
endif

" set background=light
let g:colors_name = "print"

" highlight Normal        cterm=NONE ctermfg=black ctermbg=white gui=NONE guifg=black guibg=white
highlight clear Normal

highlight NonText       ctermfg=black ctermbg=white guifg=black guibg=white
highlight LineNr        cterm=italic ctermfg=black ctermbg=white gui=italic guifg=black guibg=white

" Syntax highlighting scheme

highlight Constant      ctermfg=black ctermbg=white guifg=black guibg=white
highlight String        ctermfg=black ctermbg=white guifg=black guibg=white
highlight Character     ctermfg=black ctermbg=white guifg=black guibg=white
highlight Number        ctermfg=black ctermbg=white guifg=black guibg=white
" Boolean defaults to Constant
highlight Float         ctermfg=black ctermbg=white guifg=black guibg=white


highlight Statement     ctermfg=black ctermbg=white guifg=black guibg=white
highlight Conditional   ctermfg=black ctermbg=white guifg=black guibg=white
highlight Repeat        ctermfg=black ctermbg=white guifg=black guibg=white
highlight Label         ctermfg=black ctermbg=white guifg=black guibg=white
highlight Operator      ctermfg=black ctermbg=white guifg=black guibg=white
" Keyword defaults to Statement
" Exception defaults to Statement

highlight phpRegion        cterm=bold ctermfg=black ctermbg=white
highlight phpStructure     cterm=italic ctermfg=black ctermbg=white
highlight phpConditional     cterm=bold ctermfg=black ctermbg=white
highlight phpIdentifier     cterm=italic ctermfg=black ctermbg=white gui=italic guifg=black guibg=white
highlight phpVarSelector cterm=bold ctermfg=black ctermbg=white
highlight phpStringDouble cterm=bold ctermfg=black ctermbg=white gui=bold guifg=black guibg=white
highlight phpStringSingle cterm=bold ctermfg=black ctermbg=white gui=bold guifg=black guibg=white

highlight PreProc       cterm=bold ctermfg=black ctermbg=white gui=bold guifg=black guibg=white
" Include defaults to PreProc
" Define defaults to PreProc
" Macro defaults to PreProc
" PreCondit defaults to PreProc

highlight Comment       cterm=italic ctermfg=grey ctermbg=white
highlight Function      cterm=bold   ctermfg=black ctermbg=white
highlight Identifier    cterm=NONE ctermfg=black ctermbg=white
highlight Type          cterm=bold ctermfg=black ctermbg=white
highlight Todo          cterm=italic,bold ctermfg=black ctermbg=white

" StorageClass defaults to Type
" Structure defaults to Type
" Typedef defaults to Type

highlight Special       cterm=italic ctermfg=black ctermbg=white gui=italic guifg=black guibg=white
" SpecialChar defaults to Special
" Tag defaults to Special
" Delimiter defaults to Special
highlight SpecialComment cterm=italic ctermfg=black ctermbg=white gui=italic guifg=black guibg=white
" Debug defaults to Special

" Ideally, the bg color would be white but VIM cannot print white on black!
highlight Error         cterm=bold,reverse ctermfg=black ctermbg=grey gui=bold,reverse guifg=black guibg=grey

" vim:et:ff=unix:tw=0:ts=4:sw=4
" EOF print_bw.vim
